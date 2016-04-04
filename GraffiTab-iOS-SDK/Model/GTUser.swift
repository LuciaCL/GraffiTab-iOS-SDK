//
//  GTUser.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 04/04/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit
import ObjectMapper

public class GTUser: Mappable {

    public var id: Int?
    public var guid: String?
    public var username: String?
    public var firstName: String?
    public var lastName: String?
    public var email: String?
    public var followedByCurrentUser: Bool?
    public var createdOn: NSDate?
    public var updatedOn: NSDate?
    public var about: String?
    public var website: String?
    public var avatar: GTAsset?
    public var cover: GTAsset?
    
    required public init?(_ map: Map) {
        
    }
    
    public func mapping(map: Map) {
        id <- map["id"]
        guid <- map["guid"]
        username <- map["username"]
        firstName <- map["firstName"]
        lastName <- map["lastName"]
        email <- map["email"]
        followedByCurrentUser <- map["followedByCurrentUser"]
        createdOn = GTUtils.dateFromString(map["createdOn"].value(), format: GTDateConstants.InputFormat)
        updatedOn = GTUtils.dateFromString(map["updatedOn"].value(), format: GTDateConstants.InputFormat)
        about <- map["about"]
        website <- map["website"]
        avatar <- map["avatar"]
        cover <- map["cover"]
    }
    
    func getFullName() -> String {
        return firstName! + " " + lastName!
    }
}