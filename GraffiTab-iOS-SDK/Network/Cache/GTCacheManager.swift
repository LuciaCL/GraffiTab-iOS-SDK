//
//  GTCacheManager.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 04/04/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit

public class GTCacheManager: NSObject {

    public static let sharedInstance = GTCacheManager()
    
    public let cache = NSCache()
}
