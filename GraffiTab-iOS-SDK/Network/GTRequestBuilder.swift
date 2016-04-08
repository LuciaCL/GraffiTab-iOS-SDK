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
    
    class func buildImportExternalProviderAvatarUrl(type: GTExternalProviderType) -> String {
        return String(format: GTMeConstants.ImportAvatar, "/" + type.rawValue)
    }
    
    class func buildDeviceUrl() -> String {
        return GTMeConstants.Devices
    }
    
    class func buildGetMeUrl() -> String {
        return GTMeConstants.Me
    }
    
    class func buildGetFeedUrl(offset: Int, limit: Int) -> String {
        return String(format: "%@?offset=%li&limit=%li", GTMeConstants.Feed, offset, limit)
    }
    
    // MARK: - Streamable
    
    class func buildGetPopularUrl(offset: Int, limit: Int) -> String {
        return String(format: "%@?offset=%li&limit=%li", GTStreamableConstants.Popular, offset, limit)
    }
    
    class func buildGetNewestUrl(offset: Int, limit: Int) -> String {
        return String(format: "%@?offset=%li&limit=%li", GTStreamableConstants.Newest, offset, limit)
    }
}
