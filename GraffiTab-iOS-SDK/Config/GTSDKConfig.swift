//
//  GTSDKConfig.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 06/07/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit

public class GTSDKConfig: NSObject {

    public static let sharedInstance = GTSDKConfig()
    
    var config: GTConfig?
    
    public func getConfiguration() -> GTConfig {
        if self.config == nil {
            setConfiguration(GTConfig.defaultConfig)
        }
        
        return config!
    }
    
    public func setConfiguration(config: GTConfig) {
        self.config = config
        
        // Setup SDK constants.
        GTApiDomainConstants.DefaultProtocol = config.httpsEnabled! ? "https" : "http"
        GTApiDomainConstants.DefaultAppDomain = config.domain!
        
        // Setup logger.
        let isLog = config.logEnabled
        GTLog.setup(isLog!, logToDeviceLogs: isLog!, logToFile: isLog!, level: config.logLevel!)
    }
}
