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
    
    private var config: GTConfig?
    
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
        
        GTLog.logInfo(GTLogConstants.Tag, message: "Set SDK configuration", forceLog: true)
        GTLog.logDebug(GTLogConstants.Tag, message: "Domain: \(config.domain!)", forceLog: false)
        GTLog.logDebug(GTLogConstants.Tag, message: "Language: \(config.language!)", forceLog: false)
        GTLog.logDebug(GTLogConstants.Tag, message: "Log: \(config.logEnabled!)", forceLog: false)
        GTLog.logDebug(GTLogConstants.Tag, message: "Log level: \(config.logLevel!)", forceLog: false)
        GTLog.logDebug(GTLogConstants.Tag, message: "HTTPS: \(config.httpsEnabled!)", forceLog: false)
        GTLog.logDebug(GTLogConstants.Tag, message: "API url: \(GTApiDomainConstants.ApiUrl)", forceLog: false)
    }
}
