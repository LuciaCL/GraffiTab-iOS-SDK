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
    
    public class func getMe(successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTGetMeTask()
        
        return task.getMe(successBlock, failureBlock: failureBlock)
    }
}
