//
//  GTCacheManager.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 28/06/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit
import Haneke

public class GTCacheManager: NSObject {

    public func clearCache() {
        let cache = Shared.dataCache
        cache.removeAll()
    }
}
