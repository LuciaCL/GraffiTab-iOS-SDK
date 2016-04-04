//
//  GTLifecycleManager.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 04/04/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit

public class GTLifecycleManager: NSObject {

    public class func applicationWillResignActive() {
        GTCookieManager.saveCookies()
    }
    
    public class func applicationDidBecomeActive() {
        GTCookieManager.loadCookies()
    }
}
