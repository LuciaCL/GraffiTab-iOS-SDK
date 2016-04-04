//
//  GTApiConstants.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 04/04/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

struct GTApiDomainConstants {
    static let AppUrl = "http://dev.graffitab.com/"
    static let ApiUrl = AppUrl + "api/"
}

struct GTApiUserConstants {
    // Global.
    static let Users = GTApiDomainConstants.ApiUrl + "/users"
    static let ExternalProviders = Users + "/externalproviders"
    
    // Login.
    static let Login = GTApiDomainConstants.AppUrl + "login"
    static let LoginWithExternalProvider = GTApiDomainConstants.AppUrl + "externalproviders/login"
    static let Logout = GTApiDomainConstants.ApiUrl + "/logout"
    static let ResetPassword = GTApiDomainConstants.ApiUrl + "/resetpassword"
    
    // Profile.
    static let Profile = Users + "/%d"
    static let FullProfile = Users + "/%d/profile"
    static let ProfileByUsername = Users + "/username/%@"
    static let FullProfileByUsername = Users + "/username/%@/profile"
    
    // Followers.
    static let Followers = Users + "/%d/followers"
    static let Following = Users + "/%d/following"
    
    // Streamables.
    static let Streamables = Users + "/%d/streamables"
    
    // Most active.
    static let MostActive = Users + "/mostactive"
    
    // Likes.
    static let Likes = Users + "/%d/liked"
    
    // Search.
    static let Search = Users + "/search?query=%@"
}

struct GTMeConstants {
    // Global.
    static let Me = GTApiUserConstants.Users + "/me"
    
    // Profile.
    static let MyFullProfile = Me + "/profile"
    
    // Edit.
    static let ChangePassword = Me + "/changepassword"
    
    // Avatar.
    static let Avatar = Me + "/avatar"
    
    // Cover.
    static let Cover = Me + "/cover"
    
    // Notifications.
    static let Notifications = Me + "/notifications"
    static let UnreadNotificationsCount = Notifications + "/unreadcount"
    
    // Locations.
    static let Locations = Me + "/locations"
    static let Location = Locations + "/%d"
    
    // External providers.
    static let ExternalProviders = Me + "/externalproviders"
    
    // Devices.
    static let Devices = Me + "/devices"
    
    // Followers.
    static let Followers = Me + "/followers"
    static let FollowersActivity = Me + "/followers/activity"
    static let Following = Me + "/following"
    
    // Streamables.
    static let Streamables = Me + "/streamables"
    static let Streamable = Streamables + "/%d"
    static let Graffiti = Streamables + "/graffiti"
    static let Graffit = Streamables + "/graffiti/%d"
    
    // Private streamables.
    static let PrivateStreamable = Streamable + "/private"
    static let Private = Streamables + "/private"
    
    // Feed.
    static let Feed = Me + "/feed"
    
    // Likes.
    static let Likes = Me + "/liked"
    
    // Social.
    static let FilterSocialFriends = Me + "/social%@/friends"
    static let SocialFriends = String(format: FilterSocialFriends, "")
}

struct GTStreamableConstants {
    // Global.
    static let Streamables = GTApiDomainConstants.ApiUrl + "/streamables"
    
    // Streamable.
    static let Streamable = Streamables + "/%d"
    
    // Likes.
    static let Likes = Streamable + "/likes"
    
    // Comments.
    static let Comments = Streamable + "/comments"
    static let Comment = Comments + "/%d"
    
    // Newest.
    static let Newest = Streamables + "/newest"
    
    // Popular.
    static let Popular = Streamables + "/popular"
    
    // Flag.
    static let Flag = Streamable + "/flag"
    
    // Search.
    static let Search = Streamables + "/search"
    static let SearchLocation = Search + "/location?neLatitude=%d&neLongitude=%d&swLatitude=%d&swLongitude=%d"
    static let SearchHashtag = Search + "/hashtag?query=%@"
    static let SearchHashtags = Search + "/hashtags?query=%@"
}

struct GTFeedbackConstants {
    // Global.
    static let Feedback = GTApiDomainConstants.ApiUrl + "/feedback"
}