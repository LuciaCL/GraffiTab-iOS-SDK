//
//  GTLocation.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 23/05/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit
import ObjectMapper

public class GTLocation: NSObject, Mappable {
    
    public var id: Int?
    public var address: String?
    public var latitude: Double?
    public var longitude: Double?
    public var createdOn: NSDate?
    public var updatedOn: NSDate?
    
    required public init?(_ map: Map) {
        
    }
    
    public func mapping(map: Map) {
        id <- map["id"]
        address <- map["address"]
        latitude <- map["latitude"]
        longitude <- map["longitude"]
        createdOn <- (map["createdOn"], CustomDateFormatTransform(formatString: GTApiDateConstants.InputFormat))
        updatedOn <- (map["updatedOn"], CustomDateFormatTransform(formatString: GTApiDateConstants.InputFormat))
    }
    
    override public func isEqual(object: AnyObject?) -> Bool {
        if let object = object as? GTLocation {
            return id == object.id
        } else {
            return false
        }
    }
    
    override public var hash: Int {
        return id!.hashValue
    }
}
