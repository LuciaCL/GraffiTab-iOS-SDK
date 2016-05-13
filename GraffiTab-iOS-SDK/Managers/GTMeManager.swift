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

    public class func importAvatar(externalProviderType: GTApiExternalProviderType, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTImportExternalProviderAvatarTask()
        return task.importAvatar(externalProviderType, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func linkDevice(token: String, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTLinkDeviceTask()
        return task.linkDevice(token, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func linkExternalProvider(externalProviderType: GTApiExternalProviderType, externalId: String, accessToken: String, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTLinkExternalProviderTask()
        return task.link(externalProviderType, externalId: externalId, accessToken: accessToken, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func unlinkExternalProvider(externalProviderType: GTApiExternalProviderType, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTUnlinkExternalProviderTask()
        return task.unlink(externalProviderType, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func getMe(successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTGetMeTask()
        return task.getMe(successBlock, failureBlock: failureBlock)
    }
    
    public class func getMyFullProfile(successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTGetMyFullProfileTask()
        return task.getMe(successBlock, failureBlock: failureBlock)
    }
    
    public class func getFeed(offset: Int = 0, limit: Int = GTConstants.MaxItems, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTGetFeedTask()
        return task.getFeed(offset, limit: limit, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func getNotifications(offset: Int = 0, limit: Int = GTConstants.MaxItems, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTGetNotificationsTask()
        return task.getNotifications(offset, limit: limit, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func getUnseenNotificationsCount(successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTGetUnseenNotificationsCountTask()
        return task.getCount(successBlock, failureBlock: failureBlock)
    }
    
    public class func getFollowersActivity(numberOfItemsInGroup: Int = GTConstants.NumberOfItemsInGroup, offset: Int = 0, limit: Int = GTConstants.MaxItems, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTGetFollowersActivityTask()
        return task.getFollowersActivity(numberOfItemsInGroup, offset: offset, limit: limit, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func editPassword(password: String, newPassword: String, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTEditPasswordTask()
        return task.editPassword(password, newPassword: newPassword, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func editAvatar(image: UIImage, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) {
        let task = GTEditAvatarTask()
        task.edit(image, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func deleteAvatar(successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTDeleteAvatarTask()
        return task.delete(successBlock, failureBlock: failureBlock)
    }
    
    public class func editCover(image: UIImage, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) {
        let task = GTEditCoverTask()
        task.edit(image, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func deleteCover(successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTDeleteCoverTask()
        return task.delete(successBlock, failureBlock: failureBlock)
    }
    
    public class func editProfile(firstName: String, lastName: String, email: String, about: String?, website: String?, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) {
        let task = GTEditProfileTask()
        task.edit(firstName, lastName: lastName, email: email, about: about, website: website, successBlock: successBlock, failureBlock: failureBlock)
    }
}
