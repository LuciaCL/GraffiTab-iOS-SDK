//
//  GTUser.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 04/04/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit
import ObjectMapper

public class GTUser: NSObject, Mappable {

    public var id: Int?
    public var guid: String?
    public var username: String?
    public var firstName: String?
    public var lastName: String?
    public var email: String?
    public var createdOn: NSDate?
    public var updatedOn: NSDate?
    public var about: String?
    public var website: String?
    public var avatar: GTAsset?
    public var cover: GTAsset?
    public var followedByCurrentUser: Bool?
    public var followersCount: Int?
    public var followingCount: Int?
    public var streamablesCount: Int?
    
    required public init?(_ map: Map) {
        
    }
    
    public func mapping(map: Map) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = GTApiDateConstants.InputFormat
        
        id <- map["id"]
        guid <- map["guid"]
        username <- map["username"]
        firstName <- map["firstName"]
        lastName <- map["lastName"]
        email <- map["email"]
        createdOn <- (map["createdOn"], DateFormatterTransform(dateFormatter: dateFormatter))
        updatedOn <- (map["updatedOn"], DateFormatterTransform(dateFormatter: dateFormatter))
        about <- map["about"]
        website <- map["website"]
        avatar <- map["avatar"]
        cover <- map["cover"]
        followedByCurrentUser <- map["followedByCurrentUser"]
        followersCount <- map["followersCount"]
        followingCount <- map["followingCount"]
        streamablesCount <- map["streamablesCount"]
    }
    
    public func getFullName() -> String {
        return firstName! + " " + lastName!
    }
    
    public func getMentionUsername() -> String {
        return String(format: "@%@", username!)
    }
    
    override public func isEqual(object: AnyObject?) -> Bool {
        if let object = object as? GTUser {
            return id == object.id
        } else {
            return false
        }
    }
    
    override public var hash: Int {
        return id!.hashValue
    }
}
