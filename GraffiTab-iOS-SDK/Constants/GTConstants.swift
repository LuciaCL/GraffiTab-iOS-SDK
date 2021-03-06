//
//  GTConstants.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 04/04/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

public struct GTConstants {
    public static let MaxItems = 20
    public static let NumberOfItemsInGroup = 5
}

public struct GTEvents {
    public static let FeedbackSent = "FeedbackSent"
    
    public static let DeviceLinked = "DeviceLinked"
    public static let DeviceUnlinked = "DeviceUnlinked"
    
    public static let ExternalProviderLinked = "ExternalProviderLinked"
    public static let ExternalProviderUnlinked = "ExternalProviderUnlinked"
    
    public static let LocationCreated = "LocationCreated"
    public static let LocationChanged = "LocationChanged"
    public static let LocationDeleted = "LocationDeleted"
    
    public static let CommentPosted = "CommentPosted"
    public static let CommentChanged = "CommentChanged"
    public static let CommentDeleted = "CommentDeleted"
    
    public static let UserAvatarChanged = "UserAvatarChanged"
    public static let UserCoverChanged = "UserCoverChanged"
    public static let UserProfileChanged = "UserProfileChanged"
    public static let UserFollowersChanged = "UserFollowersChanged"
    
    public static let StreamableCreated = "StreamableCreated"
    public static let StreamableChanged = "StreamableChanged"
    public static let StreamableDeleted = "StreamableDeleted"
    public static let StreamableFlagged = "StreamableFlagged"
    public static let StreamableLikesChanged = "StreamableLikesChanged"
    public static let StreamablePrivacyChanged = "StreamablePrivacyChanged"
}

struct GTPreferencesConstants {
    static let User = "User"
}

struct GTCookieConstants {
    static let CookiesKey = "cookies"
}

struct GTLogConstants {
    static let Tag = "GraffiTab SDK"
}

struct GTImageConstants {
    static let CompressionQuality = 0.7
}