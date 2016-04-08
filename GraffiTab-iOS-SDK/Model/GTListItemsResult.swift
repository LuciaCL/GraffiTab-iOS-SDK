//
//  GTListItemsResult.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 07/04/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit
import ObjectMapper

public class GTListItemsResult<T>: Mappable {

    public var items: [T]?
    public var resultsCount: Int?
    public var offset: Int?
    public var limit: Int?
    
    required public init?(_ map: Map) {
        
    }
    
    public func mapping(map: Map) {
        items <- map["items"]
        resultsCount <- map["resultsCount"]
        offset <- map["offset"]
        limit <- map["limit"]
    }
}
