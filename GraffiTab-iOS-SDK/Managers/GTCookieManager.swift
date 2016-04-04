//
//  GTCookieManager.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 04/04/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit

class GTCookieManager: NSObject {

    class func saveCookies() {
        let cookieStorage = NSHTTPCookieStorage.sharedHTTPCookieStorage()
        let defaults = NSUserDefaults.standardUserDefaults()
        let cookiesArray = NSMutableArray()
        
        for cookie in cookieStorage.cookies! {
            cookiesArray.addObject(cookie.properties!)
        }
        
        defaults.setObject(cookiesArray, forKey: GTCookieConstants.CookiesKey)
    }
    
    class func loadCookies() {
        let cookieStorage = NSHTTPCookieStorage.sharedHTTPCookieStorage()
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let cookiesArray = defaults.arrayForKey(GTCookieConstants.CookiesKey)
        if (cookiesArray != nil) {
            for cookieProperties in cookiesArray! {
                let cookie = NSHTTPCookie(properties: cookieProperties as! [String : AnyObject])
                cookieStorage.setCookie(cookie!)
            }
        }
    }
}
