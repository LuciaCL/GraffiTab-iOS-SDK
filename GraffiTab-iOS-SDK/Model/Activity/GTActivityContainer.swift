//
//  GTActivityContainer.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 11/04/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit
import ObjectMapper

public class GTActivityContainer: Mappable {

    public var user: GTUser?
    public var date: NSDate?
    public var type: GTActivityType?
    public var activities: [GTActivity]?
    
    required public init?(_ map: Map) {
        
    }
    
    public func mapping(map: Map) {
        user <- map["user"]
        date <- (map["date"], CustomDateFormatTransform(formatString: GTApiDateConstants.InputFormat))
        type <- map["type"]
        activities <- map["activities"]
    }
}
