//
//  GTExternalProvider.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 15/06/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit
import ObjectMapper

public enum GTExternalProviderType: String {
    case FACEBOOK
    case TWITTE
    case GOOGLE
}

public class GTExternalProvider: NSObject, Mappable {
    
    public var userId: String?
    public var type: Double?
    
    required public init?(_ map: Map) {
        
    }
    
    public func mapping(map: Map) {
        userId <- map["userId"]
        type <- map["type"]
    }
    
    public func softCopy(other: GTExternalProvider) {
        self.userId = other.userId
        self.type = other.type
    }
}
