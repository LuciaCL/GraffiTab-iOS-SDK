//
//  GTAsset.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 04/04/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit
import ObjectMapper

public class GTAsset: Mappable {

    public var guid: String?
    public var link: String?
    public var thumbnail: String?
    public var type: String?
    public var width: Int?
    public var height: Int?
    public var thumbnailWidth: Int?
    public var thumbnailHeight: Int?
    
    required public init?(_ map: Map) {
        
    }
    
    public func mapping(map: Map) {
        guid <- map["guid"]
        link <- map["link"]
        thumbnail <- map["thumbnail"]
        type <- map["type"]
        width <- map["width"]
        height <- map["height"]
        thumbnailWidth <- map["thumbnailWidth"]
        thumbnailHeight <- map["thumbnailHeight"]
    }
    
    public func softCopy(other: GTAsset) {
        self.guid = other.guid
        self.link = other.link
        self.thumbnail = other.thumbnail
        self.type = other.type
        self.width = other.width
        self.height = other.height
        self.thumbnailWidth = other.thumbnailWidth
        self.thumbnailHeight = other.thumbnailHeight
    }
}
