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

public class GTStreamable: Mappable {

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
    public var likersCount: Int?
    public var commentsCount: Int?
    
    required public init?(_ map: Map) {
        
    }
    
    public func mapping(map: Map) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = GTApiDateConstants.InputFormat
        
        id <- map["id"]
        user <- map["user"]
        createdOn <- (map["createdOn"], DateFormatterTransform(dateFormatter: dateFormatter))
        updatedOn <- (map["updatedOn"], DateFormatterTransform(dateFormatter: dateFormatter))
        type <- map["type"]
        isPrivate <- map["isPrivate"]
        isFlagged <- map["isFlagged"]
        asset <- map["asset"]
        latitude <- map["latitude"]
        longitude <- map["longitude"]
        roll <- map["roll"]
        yaw <- map["yaw"]
        pitch <- map["pitch"]
        likersCount <- map["likersCount"]
        commentsCount <- map["commentsCount"]
    }
}
