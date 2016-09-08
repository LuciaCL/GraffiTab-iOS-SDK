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
    
    func request(method: Alamofire.Method, URLString: URLStringConvertible, headers: [String:String]? = nil, parameters: [String : AnyObject]?, encoding: ParameterEncoding = .URL, completionHandler: (Response<AnyObject, NSError>) -> Void) -> Request {
        loadedUrl = URLString.URLString
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        // Setup custom headers.
        var modifiedHeaders = headers
        if modifiedHeaders == nil {
            modifiedHeaders = [String:String]()
        }
        modifiedHeaders!["Accept-Language"] = GTSDKConfig.sharedInstance.getConfiguration().language
        
        // Prepare web request.
        let request = Alamofire.request(method, URLString, parameters: parameters, encoding: encoding, headers: modifiedHeaders)
        
        let requestBlock = {
            GTLog.logDebug(GTLogConstants.Tag, message: "Sending request:\nMethod: \(method)\nUrl: \(URLString)\nHeaders: \(modifiedHeaders!)\nParameters: \(parameters)\n\n", forceLog: false)
            
            request.validate()
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
        
        // Check cache only on GET method.
        if method == .GET && cacheResponse {
            GTCache.sharedInstance.fetchCachedDataResponse(URLString.URLString, onSuccess: { (data) in
                do {
                    let decoded = try NSJSONSerialization.JSONObjectWithData(data, options: [])
                    
                    // At this point we have a cached response.
                    self.parseJSONCacheSuccess(decoded)
                    
                    GTUtils.runWithDelay(0.5, block: { // Delay request so that client has time to process cache.
                        requestBlock()
                    })
                } catch let error as NSError {
                    GTLog.logError(GTLogConstants.Tag, message: "Error fetching cached response for request:\nUrl: \(URLString)\nError: \(error)\n\n", forceLog: true)
                }
            }, onError: {(error) in
                GTLog.logError(GTLogConstants.Tag, message: "Error fetching cached response for request:\nUrl: \(URLString)\nError: \(error)\n\n", forceLog: true)
                
                GTUtils.runWithDelay(0.5, block: { // Delay request so that client has time to process cache.
                    requestBlock()
                })
            })
        }
        else {
            // Send web request.
            requestBlock()
        }
        
        return request
    }
    
    func uploadRequest(method: Alamofire.Method, URLString: URLStringConvertible, headers: [String:String]? = nil, data: NSData, completionHandler: (Response<AnyObject, NSError>) -> Void) {
        loadedUrl = URLString.URLString
        
        // Setup custom headers.
        var modifiedHeaders = headers
        if modifiedHeaders == nil {
            modifiedHeaders = [String:String]()
        }
        modifiedHeaders!["Accept-Language"] = GTSDKConfig.sharedInstance.getConfiguration().language
        
        GTLog.logDebug(GTLogConstants.Tag, message: "Sending request:\nMethod: \(method)\nUrl: \(URLString)\nHeaders: \(modifiedHeaders!)\nUpload size: \(Double(data.length) / 1024.0) KB\n\n", forceLog: false)
        
        // Prepare web request.
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        Alamofire.upload(method, URLString, headers: modifiedHeaders, data: data)
            .validate()
            .responseJSON(completionHandler: { (response: Response<AnyObject, NSError>) -> Void in
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                completionHandler(response)
            })
    }
    
    func multipartFileUploadRequest(method: Alamofire.Method, URLString: URLStringConvertible, headers: [String:String]? = nil, fileData: NSData, properties: [String : AnyObject]?, completionHandler: (Response<AnyObject, NSError>) -> Void) {
        loadedUrl = URLString.URLString
        
        // Setup custom headers.
        var modifiedHeaders = headers
        if modifiedHeaders == nil {
            modifiedHeaders = [String:String]()
        }
        modifiedHeaders!["Accept-Language"] = GTSDKConfig.sharedInstance.getConfiguration().language
        
        GTLog.logDebug(GTLogConstants.Tag, message: "Sending request:\nMethod: \(method)\nUrl: \(URLString)\nHeaders: \(modifiedHeaders!)\nUpload size: \(Double(fileData.length) / 1024.0) KB\n\n", forceLog: false)

        do {
            var jsonData: NSData?
            if properties != nil {
                jsonData = try NSJSONSerialization.dataWithJSONObject(properties!, options: NSJSONWritingOptions.PrettyPrinted)
            }
            
            // Prepare web request.
            UIApplication.sharedApplication().networkActivityIndicatorVisible = true
            Alamofire.upload(method, URLString, headers: modifiedHeaders, multipartFormData: { (multipartFormData) in
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
        error.statusCode = 500
        error.message = ""
        error.reason = .OTHER
        
        if networkResponse != nil {
            error.statusCode = networkResponse?.response?.statusCode
            if let data = networkResponse!.data { // Check if there's data for the response.
                do {
                    // Encode the data.
                    let json = try NSJSONSerialization.JSONObjectWithData(data, options:[]) as? NSDictionary
                    if json != nil {
                        let resultCodeString = json!["resultCode"]
                        let resultMessageString = json!["resultMessage"]
                        
                        // Set result code.
                        if resultCodeString != nil {
                            error.reason = GTReason(rawValue: resultCodeString as! String)
                        }
                        else {
                            error.reason = .OTHER
                        }
                        
                        // Set result message.
                        if resultMessageString != nil {
                            error.message = resultMessageString as! String
                        }
                        else {
                            error.message = ""
                        }
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
