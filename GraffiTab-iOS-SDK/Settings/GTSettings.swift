//
//  GTSettings.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 04/04/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit
import ObjectMapper

public class GTSettings: NSObject {

    public static let sharedInstance = GTSettings()
    
    var tmpUser: GTUser?
    public var user: GTUser? {
        get {
            return tmpUser
        }
        set(newUser) {
            tmpUser = newUser
            
            if (tmpUser != nil) {
                let JSONString = Mapper<GTUser>().toJSONString(tmpUser!)
                setStringPreference(JSONString!, key: GTPreferencesConstants.User)
            }
            else {
                removePreferenceForKey(GTPreferencesConstants.User)
            }
        }
    }
    
    override init() {
        super.init()
        
        basicInit()
    }
    
    func basicInit() {
        let userJson = getStringPreference(GTPreferencesConstants.User)
        
        if (userJson != nil) {
            user = Mapper<GTUser>().map(userJson)
        }
    }
    
    public func logout() {
        user = nil
    }
    
    public func isLoggedIn() -> Bool {
        return user != nil
    }
    
    func getStringPreference(key: String) -> String? {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if (defaults.objectForKey(key) != nil) {
            return defaults.objectForKey(key) as? String
        }
        else {
            return nil
        }
    }
    
    func setStringPreference(value: String, key: String) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(value, forKey: key)
        defaults.synchronize()
    }
    
    func removePreferenceForKey(key: String) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.removeObjectForKey(key)
        defaults.synchronize()
    }
}
