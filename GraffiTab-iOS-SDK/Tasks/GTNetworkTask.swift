//
//  GTNetworkTask.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 04/04/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit
import Alamofire

class GTNetworkTask: NSObject {

    var sBlock: ((response: GTResponseObject) -> Void)!
    var cBlock: ((response: GTResponseObject) -> Void)!
    var fBlock: ((response: GTResponseObject) -> Void)!
    var cacheResponse: Bool = false
    var loadedUrl: String?
    
    // MARK: - Requests
    
    func request(method: Alamofire.Method, URLString: URLStringConvertible, parameters: [String : AnyObject]?, encoding: ParameterEncoding = .URL, completionHandler: (Response<AnyObject, NSError>) -> Void) -> Request {
        loadedUrl = URLString.URLString
        
        if method == .GET && cacheResponse { // Check cache only on GET method.
            GTCache.sharedInstance.fetchCachedDataResponse(URLString.URLString, onSuccess: { (data) in
                do {
                    let decoded = try NSJSONSerialization.JSONObjectWithData(data, options: [])
                    
                    // At this point we have a cached response.
                    self.parseJSONCacheSuccess(decoded)
                } catch let error as NSError {
                    GTLog.logError(GTLogConstants.Tag, message: "Error fetching cached response for request:\nUrl: \(URLString)\nError: \(error)\n\n", forceLog: true)
                }
            })
        }
        
        GTLog.logDebug(GTLogConstants.Tag, message: "Sending request:\nMethod: \(method)\nUrl: \(URLString)\nParameters: \(parameters)\n\n", forceLog: false)
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        return Alamofire.request(method, URLString, parameters: parameters, encoding: encoding, headers: nil)
            .validate()
            .responseJSON(completionHandler: { (response: Response<AnyObject, NSError>) -> Void in
                if !response.result.isFailure && method == .GET && self.cacheResponse { // Check cache only on GET method.
                    do {
                        let json = response.result.value
                        let jsonData = try NSJSONSerialization.dataWithJSONObject(json!, options: NSJSONWritingOptions.PrettyPrinted)
                        GTCache.sharedInstance.cacheJSONResponse(URLString.URLString, data: jsonData)
                    } catch let error as NSError {
                        GTLog.logError(GTLogConstants.Tag, message: "Error caching response for request:\nUrl: \(URLString)\nError: \(error)\n\n", forceLog: true)
                    }
                }
                
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                completionHandler(response)
        })
    }
    
    func uploadRequest(method: Alamofire.Method, URLString: URLStringConvertible, headers: [String:String]?, data: NSData, completionHandler: (Response<AnyObject, NSError>) -> Void) {
        loadedUrl = URLString.URLString
        
        GTLog.logDebug(GTLogConstants.Tag, message: "Sending request:\nMethod: \(method)\nUrl: \(URLString)\n\n", forceLog: false)
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        Alamofire.upload(method, URLString, headers: headers, data: data)
            .validate()
            .responseJSON(completionHandler: { (response: Response<AnyObject, NSError>) -> Void in
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                completionHandler(response)
            })
    }
    
    func multipartFileUploadRequest(method: Alamofire.Method, URLString: URLStringConvertible, fileData: NSData, properties: [String : AnyObject]?, completionHandler: (Response<AnyObject, NSError>) -> Void) {
        loadedUrl = URLString.URLString
        
        GTLog.logDebug(GTLogConstants.Tag, message: "Sending request:\nMethod: \(method)\nUrl: \(URLString)\n\n", forceLog: false)

        do {
            var jsonData: NSData?
            if properties != nil {
                jsonData = try NSJSONSerialization.dataWithJSONObject(properties!, options: NSJSONWritingOptions.PrettyPrinted)
            }
            
            UIApplication.sharedApplication().networkActivityIndicatorVisible = true
            Alamofire.upload(method, URLString, multipartFormData: { (multipartFormData) in
                multipartFormData.appendBodyPart(data: fileData, name: "file", fileName: "file", mimeType: "image/png")
                
                if jsonData != nil {
                    multipartFormData.appendBodyPart(data: jsonData!, name: "properties", fileName: "properties", mimeType: "application/json")
                }
            }) { (encodingResult) in
                switch encodingResult {
                case .Success(let upload, _, _):
                    upload
                        .validate()
                        .responseJSON(completionHandler: { (response: Response<AnyObject, NSError>) -> Void in
                            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                            completionHandler(response)
                        })
                case .Failure(_):
                    GTLog.logError(GTLogConstants.Tag, message: "Could not encode multipart data", forceLog: true)
                    assert(false, "[GraffiTab SDK] Could not encode multipart data")
                }
            }
        } catch (_) {
            GTLog.logError(GTLogConstants.Tag, message: "Invalid JSON - Could not serialize", forceLog: true)
            assert(false, "[GraffiTab SDK] Invalid JSON - Could not serialize")
        }
    }
    
    // MARK: - Response parsing
    
    func parseJSONSuccess(JSON: AnyObject) {
        let response = GTResponseObject()
        response.error = nil
        response.object = parseJSONSuccessObject(JSON)
        response.url = loadedUrl
        
        GTLog.logDebug(GTLogConstants.Tag, message: "Received OK response for request:\nUrl: \(loadedUrl)\nJSON: \(JSON)\n\n", forceLog: false)
        finishRequestWithResponse(response)
    }
    
    func parseJSONCacheSuccess(JSON: AnyObject) {
        let response = GTResponseObject()
        response.error = nil
        response.object = parseJSONSuccessObject(JSON)
        response.url = loadedUrl
        
        finishCachedRequestWithResponse(response)
    }
    
    func parseJSONError(networkResponse: Response<AnyObject, NSError>?) {
        let response = GTResponseObject()
        response.url = loadedUrl
        
        let error = GTError()
        error.statusCode = networkResponse?.response?.statusCode
        if let data = networkResponse!.data { // Check if there's data for the response.
            do {
                // Encode the data.
                let json = try NSJSONSerialization.JSONObjectWithData(data, options:[]) as? NSDictionary
                if json != nil {
                    if let reason = GTReason(rawValue: json!["resultCode"] as! String) {
                        error.reason = reason
                    }
                    else {
                        error.reason = .OTHER
                    }
                    error.message = json!["resultMessage"] as! String
                }
                else {
                    error.reason = .OTHER
                    error.message = ""
                }
            }
            catch {
                print("Error: \(error)")
            }
        }
        response.error = error
        
        GTLog.logDebug(GTLogConstants.Tag, message: "Received ERROR response for request:\nUrl: \(loadedUrl)\nStatus Code: \(error.statusCode)\nReason: \(error.reason)\nMessage: \(error.message)\n\n", forceLog: false)
        finishRequestWithResponse(response)
    }
    
    func parseJSONSuccessObject(JSON: AnyObject) -> AnyObject? {
        return JSON
    }
    
    func finishRequestWithResponse(response: GTResponseObject) {
        if (response.error == nil) {
            if (sBlock != nil) {
                sBlock(response: response)
            }
        }
        else {
            if (fBlock != nil) {
                fBlock(response: response)
            }
        }
    }
    
    func finishCachedRequestWithResponse(response: GTResponseObject) {
        if (cBlock != nil) {
            cBlock(response: response)
        }
    }
}
