//
//  GTRequestBuilder.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 04/04/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit

class GTRequestBuilder: NSObject {

    // MARK: - User
    
    class func buildLoginUrl() -> String {
        return GTApiUserConstants.Login
    }
    
    class func buildLogoutUrl() -> String {
        return GTApiUserConstants.Logout
    }
    
    class func buildLoginWithExternalProviderUrl() -> String {
        return GTApiUserConstants.LoginWithExternalProvider
    }
    
    class func buildResetPasswordUrl() -> String {
        return GTApiUserConstants.ResetPassword
    }
    
    class func buildRegisterWithExternalProviderUrl() -> String {
        return GTApiUserConstants.ExternalProviders
    }
    
    class func buildRegisterUrl() -> String {
        return GTApiUserConstants.Users
    }
    
    class func buildSearchUsersUrl(query: String, offset: Int, limit: Int) -> String {
        return String(format: "%@&offset=%li&limit=%li", String(format: GTApiUserConstants.Search, query.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet())!), offset, limit)
    }
    
    class func buildGetMostActiveUsersUrl(offset: Int, limit: Int) -> String {
        return String(format: "%@?offset=%li&limit=%li", GTApiUserConstants.MostActive, offset, limit)
    }
    
    // MARK: - Me
    
    class func buildImportExternalProviderAvatarUrl(type: GTApiExternalProviderType) -> String {
        return String(format: GTApiMeConstants.ImportAvatar, "/" + type.rawValue)
    }
    
    class func buildDeviceUrl() -> String {
        return GTApiMeConstants.Devices
    }
    
    class func buildGetMeUrl() -> String {
        return GTApiMeConstants.Me
    }
    
    class func buildGetFeedUrl(offset: Int, limit: Int) -> String {
        return String(format: "%@?offset=%li&limit=%li", GTApiMeConstants.Feed, offset, limit)
    }
    
    class func buildGetNotificationsUrl(offset: Int, limit: Int) -> String {
        return String(format: "%@?offset=%li&limit=%li", GTApiMeConstants.Notifications, offset, limit)
    }
    
    class func buildGetUnseenNotificationsCountUrl() -> String {
        return GTApiMeConstants.UnreadNotificationsCount
    }
    
    class func buildGetFollowersActivityUrl(numberOfItemsInGroup: Int, offset: Int, limit: Int) -> String {
        return String(format: "%@?numberOfItemsInGroup=%li&offset=%li&limit=%li", GTApiMeConstants.FollowersActivity, numberOfItemsInGroup, offset, limit)
    }
    
    class func buildEditPasswordUrl() -> String {
        return GTApiMeConstants.ChangePassword
    }
    
    class func buildAvatarUrl() -> String {
        return GTApiMeConstants.Avatar
    }
    
    class func buildCoverUrl() -> String {
        return GTApiMeConstants.Cover
    }
    
    // MARK: - Streamable
    
    class func buildGetPopularUrl(offset: Int, limit: Int) -> String {
        return String(format: "%@?offset=%li&limit=%li", GTApiStreamableConstants.Popular, offset, limit)
    }
    
    class func buildGetNewestUrl(offset: Int, limit: Int) -> String {
        return String(format: "%@?offset=%li&limit=%li", GTApiStreamableConstants.Newest, offset, limit)
    }
    
    class func buildSearchStreamablesForLocationUrl(neLatitude: Double, neLongitude: Double, swLatitude: Double, swLongitude: Double) -> String {
        return String(format: GTApiStreamableConstants.SearchLocation, neLatitude, neLongitude, swLatitude, swLongitude)
    }
    
    class func buildSearchStreamablesForHashtagUrl(query: String, offset: Int, limit: Int) -> String {
        return String(format: "%@&offset=%li&limit=%li", String(format: GTApiStreamableConstants.SearchHashtag, query.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet())!), offset, limit)
    }
    
    // MARK: - Feedback
    
    class func buildFeedbackUrl() -> String {
        return GTApiFeedbackConstants.Feedback
    }
}
