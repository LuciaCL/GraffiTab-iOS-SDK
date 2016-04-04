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
    
    required public init?(_ map: Map) {
        
    }
    
    public func mapping(map: Map) {
        guid <- map["guid"]
        link <- map["link"]
        thumbnail <- map["thumbnail"]
        type <- map["type"]
    }
}
