//
//  GTComment.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 11/04/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit
import ObjectMapper

public class GTComment: Mappable {

    public var id: Int?
    public var streamable: GTStreamable?
    public var user: GTUser?
    public var text: String?
    public var createdOn: NSDate?
    public var updatedOn: NSDate?
    
    required public init?(_ map: Map) {
        
    }
    
    public func mapping(map: Map) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = GTDateConstants.InputFormat
        
        id <- map["id"]
        streamable <- map["streamable"]
        user <- map["user"]
        text <- map["text"]
        createdOn <- (map["createdOn"], DateFormatterTransform(dateFormatter: dateFormatter))
        updatedOn <- (map["updatedOn"], DateFormatterTransform(dateFormatter: dateFormatter))
    }
}
