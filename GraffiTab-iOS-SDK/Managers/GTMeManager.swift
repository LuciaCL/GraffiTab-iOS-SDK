//
//  GTMeManager.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 07/04/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit
import Alamofire

public class GTMeManager: NSObject {

    public class func importAvatar(externalProviderType: GTExternalProviderType, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTImportExternalProviderAvatarTask()
        return task.importAvatar(externalProviderType, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func linkDevice(token: String, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTLinkDeviceTask()
        return task.linkDevice(token, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func getMe(successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTGetMeTask()
        return task.getMe(successBlock, failureBlock: failureBlock)
    }
    
    public class func getFeed(offset: Int = 0, limit: Int = GTConstants.MaxItems, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTGetFeedTask()
        return task.getFeed(offset, limit: limit, successBlock: successBlock, failureBlock: failureBlock)
    }
}
