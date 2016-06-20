//
//  GTUserSocialFriendsContainer.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 20/06/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit
import ObjectMapper

public class GTUserSocialFriendsContainer: Mappable {
    
    public var type: GTExternalProviderType?
    public var users: [GTUser]?
    public var resultsCount: Int?
    public var offset: Int?
    public var limit: Int?
    
    required public init?(_ map: Map) {
        
    }
    
    public func mapping(map: Map) {
        type <- map["type"]
        users <- map["users"]
        resultsCount <- map["resultsCount"]
        offset <- map["offset"]
        limit <- map["limit"]
    }
}