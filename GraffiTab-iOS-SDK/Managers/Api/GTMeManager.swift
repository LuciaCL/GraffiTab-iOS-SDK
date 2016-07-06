//
//  GTMeManager.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 07/04/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

public class GTMeManager: NSObject {

    public static let sharedInstance = GTMeManager()
    
    public var loggedInUser: GTUser? {
        didSet {
            if (loggedInUser != nil) {
                let JSONString = Mapper<GTUser>().toJSONString(loggedInUser!)
                GTSettings.setStringPreference(JSONString!, key: GTPreferencesConstants.User)
            }
            else {
                GTSettings.removePreferenceForKey(GTPreferencesConstants.User)
            }
        }
    }
    
    public class func importAvatar(externalProviderType: GTExternalProviderType, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTImportExternalProviderAvatarTask()
        return task.importAvatar(externalProviderType, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func linkDevice(token: String, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTLinkDeviceTask()
        return task.linkDevice(token, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func linkExternalProvider(externalProviderType: GTExternalProviderType, externalId: String, accessToken: String, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTLinkExternalProviderTask()
        return task.link(externalProviderType, externalId: externalId, accessToken: accessToken, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func unlinkExternalProvider(externalProviderType: GTExternalProviderType, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTUnlinkExternalProviderTask()
        return task.unlink(externalProviderType, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func getMe(cacheResponse: Bool? = false, cacheBlock: ((response: GTResponseObject) -> Void)? = nil, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTGetMeTask()
        return task.getMe(successBlock, failureBlock: failureBlock)
    }
    
    public class func getMyFullProfile(cacheResponse: Bool? = false, cacheBlock: ((response: GTResponseObject) -> Void)? = nil, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTGetMyFullProfileTask()
        return task.getMe(successBlock, failureBlock: failureBlock)
    }
    
    public class func getFeed(offset: Int = 0, limit: Int = GTConstants.MaxItems, cacheResponse: Bool? = false, cacheBlock: ((response: GTResponseObject) -> Void)? = nil, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTGetFeedTask()
        task.cacheResponse = cacheResponse!
        task.cBlock = cacheBlock
        return task.getFeed(offset, limit: limit, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func getPrivateStreamables(offset: Int = 0, limit: Int = GTConstants.MaxItems, cacheResponse: Bool? = false, cacheBlock: ((response: GTResponseObject) -> Void)? = nil, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTGetPrivateStreamablesTask()
        task.cacheResponse = cacheResponse!
        task.cBlock = cacheBlock
        return task.getPrivateStreamables(offset, limit: limit, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func markStreamablePublic(streamableId: Int, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTMarkStreamablePublicTask()
        return task.makePublic(streamableId, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func markStreamablePrivate(streamableId: Int, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTMarkStreamablePrivateTask()
        return task.makePrivate(streamableId, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func deleteStreamable(streamableId: Int, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTDeleteStreamableTask()
        return task.delete(streamableId, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func getNotifications(offset: Int = 0, limit: Int = GTConstants.MaxItems, cacheResponse: Bool? = false, cacheBlock: ((response: GTResponseObject) -> Void)? = nil, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTGetNotificationsTask()
        task.cacheResponse = cacheResponse!
        task.cBlock = cacheBlock
        return task.getNotifications(offset, limit: limit, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func getUnseenNotificationsCount(successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTGetUnseenNotificationsCountTask()
        return task.getCount(successBlock, failureBlock: failureBlock)
    }
    
    public class func getFollowersActivity(numberOfItemsInGroup: Int = GTConstants.NumberOfItemsInGroup, offset: Int = 0, limit: Int = GTConstants.MaxItems, cacheResponse: Bool? = false, cacheBlock: ((response: GTResponseObject) -> Void)? = nil, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTGetFollowersActivityTask()
        task.cacheResponse = cacheResponse!
        task.cBlock = cacheBlock
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
    
    public class func createGraffiti(image: UIImage, latitude: Double, longitude: Double, pitch: CGFloat, roll: CGFloat, yaw: CGFloat, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) {
        let task = GTCreateStreamableGraffitiTask()
        task.create(image, pitch: pitch, roll: roll, yaw: yaw, latitude: latitude, longitude: longitude, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func editGraffiti(streamableId: Int, image: UIImage, latitude: Double, longitude: Double, pitch: CGFloat, roll: CGFloat, yaw: CGFloat, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) {
        let task = GTEditStreamableGraffitiTask()
        task.edit(streamableId, image: image, pitch: pitch, roll: roll, yaw: yaw, latitude: latitude, longitude: longitude, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func createLocation(address: String, latitude: Double, longitude: Double, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) {
        let task = GTCreateLocationTask()
        task.create(address, latitude: latitude, longitude: longitude, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func getLocations(cacheResponse: Bool? = false, cacheBlock: ((response: GTResponseObject) -> Void)? = nil, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) {
        let task = GTGetLocationsTask()
        task.getLocations(successBlock, failureBlock: failureBlock)
    }
    
    public class func deleteLocation(locationId: Int, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) {
        let task = GTDeleteLocationTask()
        task.delete(locationId, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func editLocation(locationId: Int, address: String, latitude: Double, longitude: Double, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) {
        let task = GTEditLocationTask()
        task.edit(locationId, address: address, latitude: latitude, longitude: longitude, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func getSocialFriends(offset: Int = 0, limit: Int = GTConstants.MaxItems, cacheResponse: Bool? = false, cacheBlock: ((response: GTResponseObject) -> Void)? = nil, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTGetSocialFriendsTask()
        task.cacheResponse = cacheResponse!
        task.cBlock = cacheBlock
        return task.getSocialFriends(offset, limit: limit, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func getSocialFriendsForNetwork(type: GTExternalProviderType, offset: Int = 0, limit: Int = GTConstants.MaxItems, cacheResponse: Bool? = false, cacheBlock: ((response: GTResponseObject) -> Void)? = nil, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTGetSocialFriendsForNetworkTask()
        task.cacheResponse = cacheResponse!
        task.cBlock = cacheBlock
        return task.getSocialFriends(type, offset: offset, limit: limit, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    override init() {
        super.init()
        
        basicInit()
    }
    
    func basicInit() {
        let userJson = GTSettings.getStringPreference(GTPreferencesConstants.User)
        
        if (userJson != nil) {
            loggedInUser = Mapper<GTUser>().map(userJson)
        }
    }
    
    public func logout() {
        loggedInUser = nil
        
        NSURLCache.sharedURLCache().removeAllCachedResponses()
        
        GTSettings.clearCookies()
    }
    
    public func isLoggedIn() -> Bool {
        return loggedInUser != nil
    }
}
