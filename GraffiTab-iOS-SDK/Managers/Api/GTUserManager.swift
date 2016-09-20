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
    
    public class func logout(successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTLogoutTask()
        return task.logout(successBlock, failureBlock: failureBlock)
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
    
    public class func search(query: String = "", offset: Int = 0, limit: Int = GTConstants.MaxItems, cacheResponse: Bool? = false, cacheBlock: ((response: GTResponseObject) -> Void)? = nil, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTSearchUsersTask()
        task.cacheResponse = cacheResponse!
        task.cBlock = cacheBlock
        return task.search(query, offset: offset, limit: limit, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func getMostActive(offset: Int = 0, limit: Int = GTConstants.MaxItems, cacheResponse: Bool? = false, cacheBlock: ((response: GTResponseObject) -> Void)? = nil, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTGetMostActiveUsersTask()
        task.cacheResponse = cacheResponse!
        task.cBlock = cacheBlock
        return task.getMostActive(offset, limit: limit, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func getUserStreamables(userId: Int, offset: Int = 0, limit: Int = GTConstants.MaxItems, cacheResponse: Bool? = false, cacheBlock: ((response: GTResponseObject) -> Void)? = nil, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTGetUserStreamablesTask()
        task.cacheResponse = cacheResponse!
        task.cBlock = cacheBlock
        return task.getStreamables(userId, offset: offset, limit: limit, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func getUserMentions(userId: Int, offset: Int = 0, limit: Int = GTConstants.MaxItems, cacheResponse: Bool? = false, cacheBlock: ((response: GTResponseObject) -> Void)? = nil, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTGetUserMentionsTask()
        task.cacheResponse = cacheResponse!
        task.cBlock = cacheBlock
        return task.getMentions(userId, offset: offset, limit: limit, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func getLikedStreamables(userId: Int, offset: Int = 0, limit: Int = GTConstants.MaxItems, cacheResponse: Bool? = false, cacheBlock: ((response: GTResponseObject) -> Void)? = nil, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTGetUserLikedStreamablesTask()
        task.cacheResponse = cacheResponse!
        task.cBlock = cacheBlock
        return task.getLikedStreamables(userId, offset: offset, limit: limit, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func follow(userId: Int, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTFollowTask()
        return task.follow(userId, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func unfollow(userId: Int, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTUnfollowTask()
        return task.unfollow(userId, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func getFollowers(userId: Int, offset: Int = 0, limit: Int = GTConstants.MaxItems, cacheResponse: Bool? = false, cacheBlock: ((response: GTResponseObject) -> Void)? = nil, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTGetFollowersTask()
        task.cacheResponse = cacheResponse!
        task.cBlock = cacheBlock
        return task.getFollowers(userId, offset: offset, limit: limit, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func getFollowing(userId: Int, offset: Int = 0, limit: Int = GTConstants.MaxItems, cacheResponse: Bool? = false, cacheBlock: ((response: GTResponseObject) -> Void)? = nil, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTGetFollowingTask()
        task.cacheResponse = cacheResponse!
        task.cBlock = cacheBlock
        return task.getFollowing(userId, offset: offset, limit: limit, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func getUserProfile(userId: Int, cacheResponse: Bool? = false, cacheBlock: ((response: GTResponseObject) -> Void)? = nil, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTGetUserProfileTask()
        task.cacheResponse = cacheResponse!
        task.cBlock = cacheBlock
        return task.getProfile(userId, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func getUserFullProfile(userId: Int, cacheResponse: Bool? = false, cacheBlock: ((response: GTResponseObject) -> Void)? = nil, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTGetUserFullProfileTask()
        task.cacheResponse = cacheResponse!
        task.cBlock = cacheBlock
        return task.getProfile(userId, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func getUserProfileByUsername(username: String, cacheResponse: Bool? = false, cacheBlock: ((response: GTResponseObject) -> Void)? = nil, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTGetUserProfileByUsernameTask()
        task.cacheResponse = cacheResponse!
        task.cBlock = cacheBlock
        return task.getProfile(username, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func getUserFullProfileByUsername(username: String, cacheResponse: Bool? = false, cacheBlock: ((response: GTResponseObject) -> Void)? = nil, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTGetUserFullProfileByUsernameTask()
        task.cacheResponse = cacheResponse!
        task.cBlock = cacheBlock
        return task.getProfile(username, successBlock: successBlock, failureBlock: failureBlock)
    }
}
