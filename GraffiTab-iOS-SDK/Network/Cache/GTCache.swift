//
//  GTCache.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 04/04/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit
import Haneke

class GTCache: NSObject {

    static let sharedInstance = GTCache()
    
    func fetchCachedDataResponse(url: String, onSuccess: NSData -> ()) {
        let cache = Shared.dataCache
        cache.fetch(key: url).onSuccess(onSuccess)
    }
    
    func cacheJSONResponse(url: String, data: NSData) {
        let cache = Shared.dataCache
        cache.set(value: data, key: url)
    }
}
