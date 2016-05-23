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
    
    class func buildGetUserStreamablesUrl(userId: Int, offset: Int, limit: Int) -> String {
        return String(format: "%@?offset=%li&limit=%li", String(format: GTApiUserConstants.Streamables, userId), offset, limit)
    }
    
    class func buildFollowersUrl(userId: Int) -> String {
        return String(format: GTApiUserConstants.Followers, userId)
    }
    
    class func buildGetFollowersUrl(userId: Int, offset: Int, limit: Int) -> String {
        return String(format: "%@?offset=%li&limit=%li", String(format: GTApiUserConstants.Followers, userId), offset, limit)
    }
    
    class func buildGetFollowingUrl(userId: Int, offset: Int, limit: Int) -> String {
        return String(format: "%@?offset=%li&limit=%li", String(format: GTApiUserConstants.Following, userId), offset, limit)
    }
    
    class func buildGetUserLikedStreamablesUrl(userId: Int, offset: Int, limit: Int) -> String {
        return String(format: "%@?offset=%li&limit=%li", String(format: GTApiUserConstants.Likes, userId), offset, limit)
    }
    
    class func buildGetUserProfileUrl(userId: Int) -> String {
        return String(format: GTApiUserConstants.Profile, userId)
    }
    
    class func buildGetUserFullProfileUrl(userId: Int) -> String {
        return String(format: GTApiUserConstants.FullProfile, userId)
    }
    
    class func buildGetUserProfileByUsernameUrl(username: String) -> String {
        return String(format: GTApiUserConstants.ProfileByUsername, username)
    }
    
    class func buildGetUserFullProfileByUsernameUrl(username: String) -> String {
        return String(format: GTApiUserConstants.FullProfileByUsername, username)
    }
    
    // MARK: - Me
    
    class func buildImportExternalProviderAvatarUrl(type: GTApiExternalProviderType) -> String {
        return String(format: GTApiMeConstants.ImportAvatar, "/" + type.rawValue)
    }
    
    class func buildExternalProviderUrl() -> String {
        return GTApiMeConstants.ExternalProviders
    }
    
    class func buildDeviceUrl() -> String {
        return GTApiMeConstants.Devices
    }
    
    class func buildGetMeUrl() -> String {
        return GTApiMeConstants.Me
    }
    
    class func buildGetMyFullProfileUrl() -> String {
        return GTApiMeConstants.MyFullProfile
    }
    
    class func buildGetFeedUrl(offset: Int, limit: Int) -> String {
        return String(format: "%@?offset=%li&limit=%li", GTApiMeConstants.Feed, offset, limit)
    }
    
    class func buildGetPrivateStreamablesUrl(offset: Int, limit: Int) -> String {
        return String(format: "%@?offset=%li&limit=%li", GTApiMeConstants.Private, offset, limit)
    }
    
    class func buildPrivateStreamableUrl(streamableId: Int) -> String {
        return String(format: GTApiMeConstants.PrivateStreamable, streamableId)
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
    
    class func buildStreamablesUrl() -> String {
        return GTApiMeConstants.Graffiti
    }
    
    class func buildStreamableUrl(streamableId: Int) -> String {
        return String(format: GTApiMeConstants.Streamable, streamableId)
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
    
    class func buildSearchHashtagsUrl(query: String) -> String {
        return String(format: GTApiStreamableConstants.SearchHashtags, query.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet())!)
    }
    
    class func buildGetLikersUrl(streamableId: Int, offset: Int, limit: Int) -> String {
        return String(format: "%@?offset=%li&limit=%li", String(format: GTApiStreamableConstants.Likes, streamableId), offset, limit)
    }
    
    class func buildLikesUrl(streamableId: Int) -> String {
        return String(format: GTApiStreamableConstants.Likes, streamableId)
    }
    
    class func buildFlagUrl(streamableId: Int) -> String {
        return String(format: GTApiStreamableConstants.Flag, streamableId)
    }
    
    class func buildGetStreamableUrl(streamableId: Int) -> String {
        return String(format: GTApiStreamableConstants.Streamable, streamableId)
    }
    
    class func buildGetCommentsUrl(streamableId: Int, offset: Int, limit: Int) -> String {
        return String(format: "%@?offset=%li&limit=%li", String(format: GTApiStreamableConstants.Comments, streamableId), offset, limit)
    }
    
    class func buildPostCommentUrl(streamableId: Int) -> String {
        return String(format: GTApiStreamableConstants.Comments, streamableId)
    }
    
    class func buildEditCommentUrl(streamableId: Int, commentId: Int) -> String {
        return String(format: GTApiStreamableConstants.Comment, streamableId, commentId)
    }
    
    // MARK: - Feedback
    
    class func buildFeedbackUrl() -> String {
        return GTApiFeedbackConstants.Feedback
    }
}
