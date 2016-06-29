//
//  GTNetworkTask.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 04/04/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit
import Alamofire
import CocoaLumberjack

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
                    DDLogError("[GraffiTab SDK] Error caching response for request \(URLString) - \(error)")
                }
            })
        }
        
        DDLogDebug("[GraffiTab SDK] Sending request \(method) - \(URLString)")
        DDLogDebug("[GraffiTab SDK] Parameters - \(parameters)")
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        return Alamofire.request(method, URLString, parameters: parameters, encoding: encoding, headers: nil)
            .validate()
            .responseJSON(completionHandler: { (response: Response<AnyObject, NSError>) -> Void in
                DDLogDebug("[GraffiTab SDK] Received response for request \(URLString) - \(response)")
                
                if response.result.isFailure {
                    DDLogError("[GraffiTab SDK] Received error response for request \(URLString) - \(response)")
                }
                else if method == .GET && self.cacheResponse { // Check cache only on GET method.
                    do {
                        let json = response.result.value
                        let jsonData = try NSJSONSerialization.dataWithJSONObject(json!, options: NSJSONWritingOptions.PrettyPrinted)
                        GTCache.sharedInstance.cacheJSONResponse(URLString.URLString, data: jsonData)
                    } catch let error as NSError {
                        DDLogError("[GraffiTab SDK] Error caching response for request \(URLString) - \(error)")
                    }
                }
                
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                completionHandler(response)
        })
    }
    
    func uploadRequest(method: Alamofire.Method, URLString: URLStringConvertible, headers: [String:String]?, data: NSData, completionHandler: (Response<AnyObject, NSError>) -> Void) {
        loadedUrl = URLString.URLString
        
        DDLogDebug("[GraffiTab SDK] Sending request \(method) - \(URLString)")
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        Alamofire.upload(method, URLString, headers: headers, data: data)
            .validate()
            .responseJSON(completionHandler: { (response: Response<AnyObject, NSError>) -> Void in
                DDLogDebug("[GraffiTab SDK] Received response for request \(URLString) - \(response)")
                
                if response.result.isFailure {
                    DDLogError("[GraffiTab SDK] Received error response for request \(URLString) - \(response)")
                }
                
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                completionHandler(response)
            })
    }
    
    func multipartFileUploadRequest(method: Alamofire.Method, URLString: URLStringConvertible, fileData: NSData, properties: [String : AnyObject]?, completionHandler: (Response<AnyObject, NSError>) -> Void) {
        loadedUrl = URLString.URLString
        
        DDLogDebug("[GraffiTab SDK] Sending request \(method) - \(URLString)")

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
                            DDLogDebug("[GraffiTab SDK] Received response for request \(URLString) - \(response)")
                            
                            if response.result.isFailure {
                                DDLogError("[GraffiTab SDK] Received error response for request \(URLString) - \(response)")
                            }
                            
                            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                            completionHandler(response)
                        })
                case .Failure(_):
                    DDLogError("[GraffiTab SDK] Could not encode multipart data")
                    assert(false, "[GraffiTab SDK] Could not encode multipart data")
                }
            }
        } catch (_) {
            DDLogError("[GraffiTab SDK] Invalid JSON - Could not serialize")
            assert(false, "[GraffiTab SDK] Invalid JSON - Could not serialize")
        }
    }
    
    // MARK: - Response parsing
    
    func parseJSONSuccess(JSON: AnyObject) {
        let response = GTResponseObject()
        response.result = GTResult.Success
        response.object = parseJSONSuccessObject(JSON)
        response.url = loadedUrl
        
        finishRequestWithResponse(response)
    }
    
    func parseJSONCacheSuccess(JSON: AnyObject) {
        let response = GTResponseObject()
        response.result = GTResult.Success
        response.object = parseJSONSuccessObject(JSON)
        response.url = loadedUrl
        
        finishCachedRequestWithResponse(response)
    }
    
    func parseJSONError(statusCode: Int) {
        let response = GTResponseObject()
        response.result = GTResult.Error
        response.url = loadedUrl
        
        if let reason = GTReason(rawValue: statusCode) {
            response.reason = reason
        }
        else {
            response.reason = .Other
        }
        response.message = response.reason.description
        
        finishRequestWithResponse(response)
    }
    
    func parseJSONSuccessObject(JSON: AnyObject) -> AnyObject? {
        return JSON
    }
    
    func finishRequestWithResponse(response: GTResponseObject) {
        if (response.result == GTResult.Success) {
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
