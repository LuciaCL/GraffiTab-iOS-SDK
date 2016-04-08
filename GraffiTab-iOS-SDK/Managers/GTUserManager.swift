//
//  GTUserManager.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 04/04/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit
import Alamofire

public class GTUserManager: NSObject {

    public class func login(username: String, password: String, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTLoginTask()
        return task.login(username, password: password, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func login(externalProviderType: GTExternalProviderType, externalId: String, accessToken: String, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTLoginWithExternalProviderTask()
        return task.login(externalProviderType, externalId: externalId, accessToken: accessToken, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func resetPassword(email: String, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTResetPasswordTask()
        return task.resetPassword(email, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func register(externalProviderType: GTExternalProviderType, externalId: String, accessToken: String, email: String, firstName: String, lastName: String, username: String, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTRegisterWithExternalProviderTask()
        return task.register(externalProviderType, externalId: externalId, accessToken: accessToken, email: email, firstName: firstName, lastName: lastName, username: username, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func register(firstName: String, lastName: String, email: String, username: String, password: String, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTRegisterTask()
        return task.register(firstName, lastName: lastName, email: email, username: username, password: password, successBlock: successBlock, failureBlock: failureBlock)
    }
}
