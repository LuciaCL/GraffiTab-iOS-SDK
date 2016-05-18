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
    var useCache: Bool?
    
    // MARK: - Requests
    
    func request(method: Alamofire.Method, URLString: URLStringConvertible, parameters: [String : AnyObject]?, encoding: ParameterEncoding = .URL, completionHandler: (Response<AnyObject, NSError>) -> Void) -> Request {
        print("DEBUG: Sending request \(method) - \(URLString)")
        print("DEBUG: Parameters - \(parameters)")
        
        return Alamofire.request(method, URLString, parameters: parameters, encoding: encoding, headers: nil)
            .validate()
            .responseJSON(completionHandler: { (response: Response<AnyObject, NSError>) -> Void in
                print("DEBUG: Received response for request \(URLString) - \(response)")
                completionHandler(response)
            })
    }
    
    func uploadRequest(method: Alamofire.Method, URLString: URLStringConvertible, headers: [String:String]?, data: NSData, completionHandler: (Response<AnyObject, NSError>) -> Void) {
        print("DEBUG: Sending request \(method) - \(URLString)")
        
        Alamofire.upload(method, URLString, headers: headers, data: data)
            .validate()
            .responseJSON(completionHandler: { (response: Response<AnyObject, NSError>) -> Void in
                print("DEBUG: Received response for request \(URLString) - \(response)")
                completionHandler(response)
            })
    }
    
    func uploadGraffitiRequest(method: Alamofire.Method, URLString: URLStringConvertible, graffiti: NSData, properties: [String : AnyObject]?, completionHandler: (Response<AnyObject, NSError>) -> Void) {
        print("DEBUG: Sending request \(method) - \(URLString)")

        do {
            let jsonData = try NSJSONSerialization.dataWithJSONObject(properties!, options: NSJSONWritingOptions.PrettyPrinted)
            
            Alamofire.upload(method, URLString, multipartFormData: { (multipartFormData) in
                multipartFormData.appendBodyPart(data: graffiti, name: "file", fileName: "file", mimeType: "image/png")
                multipartFormData.appendBodyPart(data: jsonData, name: "properties", fileName: "properties", mimeType: "application/json")
            }) { (encodingResult) in
                switch encodingResult {
                case .Success(let upload, _, _):
                    upload
                        .validate()
                        .responseJSON(completionHandler: { (response: Response<AnyObject, NSError>) -> Void in
                            print("DEBUG: Received response for request \(URLString) - \(response)")
                            completionHandler(response)
                        })
                case .Failure(_):
                    assert(false, "Could not encode multipart data")
                }
            }
        } catch (_) {
            assert(false, "Invalid JSON - Could not serialize")
        }
    }
    
    // MARK: - Response parsing
    
    func parseJSONSuccess(JSON: AnyObject) {
        let response = GTResponseObject()
        response.result = GTResult.Success
        response.object = parseJSONSuccessObject(JSON)
        
        finishRequestWithResponse(response)
    }
    
    func parseJSONCacheSuccess(JSON: AnyObject) {
        let response = GTResponseObject()
        response.result = GTResult.Success
        response.object = parseJSONSuccessObject(JSON)
        
        finishCachedRequestWithResponse(response)
    }
    
    func parseJSONError(statusCode: Int) {
        let response = GTResponseObject()
        response.result = GTResult.Error
        
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
