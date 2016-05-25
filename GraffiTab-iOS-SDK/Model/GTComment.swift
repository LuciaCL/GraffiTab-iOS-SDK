//
//  GTComment.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 11/04/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit
import ObjectMapper

public class GTComment: NSObject, Mappable {

    public var id: Int?
    public var streamable: GTStreamable?
    public var user: GTUser?
    public var text: String?
    public var createdOn: NSDate?
    public var updatedOn: NSDate?
    
    required public init?(_ map: Map) {
        
    }
    
    public func mapping(map: Map) {
        id <- map["id"]
        streamable <- map["streamable"]
        user <- map["user"]
        text <- map["text"]
        createdOn <- (map["createdOn"], CustomDateFormatTransform(formatString: GTApiDateConstants.InputFormat))
        updatedOn <- (map["updatedOn"], CustomDateFormatTransform(formatString: GTApiDateConstants.InputFormat))
    }
    
    public func softCopy(other: GTComment) {
        self.id = other.id
        self.streamable?.softCopy(other.streamable!)
        self.user?.softCopy(other.user!)
        self.text = other.text
        self.createdOn = other.createdOn
        self.updatedOn = other.updatedOn
    }
    
    override public func isEqual(object: AnyObject?) -> Bool {
        if let object = object as? GTComment {
            return id == object.id
        } else {
            return false
        }
    }
    
    override public var hash: Int {
        return id!.hashValue
    }
}
