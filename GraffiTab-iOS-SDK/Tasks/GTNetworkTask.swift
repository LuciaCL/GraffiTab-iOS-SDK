//
//  GTNetworkTask.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 04/04/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit

class GTNetworkTask: NSObject {

    var sBlock: ((response: GTResponseObject) -> Void)!
    var cBlock: ((response: GTResponseObject) -> Void)!
    var fBlock: ((response: GTResponseObject) -> Void)!
    var useCache: Bool?
    
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

        switch (statusCode) {
        case 500:
            response.reason = GTReason.ServerError;
            response.message = "Oups, seems like something went wrong on our server. Please contact support to report this issue.";
            break;
        case 401:
            response.reason = GTReason.AuthorizationNeeded;
            response.message = "You need to be logged in to make this request.";
            break;
        case 403:
            response.reason = GTReason.Forbidden;
            response.message = "The request is forbidden.";
            break;
        case 404:
            response.reason = GTReason.NotFound;
            response.message = "This item was not found.";
            break;
        case 409:
            response.reason = GTReason.AlreadyExists;
            response.message = "This item already exists.";
            break;
        case 400:
            response.reason = GTReason.BadRequest;
            response.message = "Bad request.";
            break;
        default:
            response.reason = GTReason.Other;
            response.message = "We could not process your request right now. Please check your connection and try again or contact Support to report this issue.";
            break;
        }
        
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
            print("ERROR (" + response.reason.description + ") MESSAGE (" + response.message + ")")
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
