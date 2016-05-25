//
//  GTStreamable.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 07/04/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit
import ObjectMapper

public enum GTStreamableType: String {
    case GRAFFITI
}

public class GTStreamable: NSObject, Mappable {

    public var id: Int?
    public var user: GTUser?
    public var createdOn: NSDate?
    public var updatedOn: NSDate?
    public var type: GTStreamableType?
    public var isPrivate: Bool?
    public var isFlagged: Bool?
    public var asset: GTAsset?
    public var latitude: Double?
    public var longitude: Double?
    public var roll: Double?
    public var yaw: Double?
    public var pitch: Double?
    public var likedByCurrentUser: Bool?
    public var likersCount: Int?
    public var commentsCount: Int?
    
    required public init?(_ map: Map) {
        
    }
    
    public func mapping(map: Map) {
        id <- map["id"]
        user <- map["user"]
        createdOn <- (map["createdOn"], CustomDateFormatTransform(formatString: GTApiDateConstants.InputFormat))
        updatedOn <- (map["updatedOn"], CustomDateFormatTransform(formatString: GTApiDateConstants.InputFormat))
        type <- map["type"]
        isPrivate <- map["isPrivate"]
        isFlagged <- map["isFlagged"]
        asset <- map["asset"]
        latitude <- map["latitude"]
        longitude <- map["longitude"]
        roll <- map["roll"]
        yaw <- map["yaw"]
        pitch <- map["pitch"]
        likedByCurrentUser <- map["likedByCurrentUser"]
        likersCount <- map["likersCount"]
        commentsCount <- map["commentsCount"]
    }
    
    public func softCopy(other: GTStreamable) {
        self.id = other.id
        self.user?.softCopy(other.user!)
        self.createdOn = other.createdOn
        self.updatedOn = other.updatedOn
        self.type = other.type
        self.isPrivate = other.isPrivate
        self.isFlagged = other.isFlagged
        self.asset?.softCopy(other.asset!)
        self.latitude = other.latitude
        self.longitude = other.longitude
        self.roll = other.roll
        self.yaw = other.yaw
        self.pitch = other.pitch
        self.likedByCurrentUser = other.likedByCurrentUser
        self.likersCount = other.likersCount
        self.commentsCount = other.commentsCount
    }
    
    override public func isEqual(object: AnyObject?) -> Bool {
        if let object = object as? GTStreamable {
            return id == object.id
        } else {
            return false
        }
    }
    
    override public var hash: Int {
        return id!.hashValue
    }
}
