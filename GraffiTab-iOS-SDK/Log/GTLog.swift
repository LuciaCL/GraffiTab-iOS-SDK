//
//  GTLog.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 06/07/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit
import CocoaLumberjack

class GTLog: NSObject {

    class func logInfo(tag: String, message: String, forceLog: Bool) {
        if forceLog || canLog() {
            DDLogInfo(String(format: "[%@] %@", tag, message))
        }
    }
    
    class func logDebug(tag: String, message: String, forceLog: Bool) {
        if forceLog || canLog() {
            DDLogDebug(String(format: "[%@] %@", tag, message))
        }
    }
    
    class func logError(tag: String, message: String, forceLog: Bool) {
        if forceLog || canLog() {
            DDLogError(String(format: "[%@] %@", tag, message))
        }
    }
    
    class func logVerbose(tag: String, message: String, forceLog: Bool) {
        if forceLog || canLog() {
            DDLogVerbose(String(format: "[%@] %@", tag, message))
        }
    }
    
    class func logWarm(tag: String, message: String, forceLog: Bool) {
        if forceLog || canLog() {
            DDLogWarn(String(format: "[%@] %@", tag, message))
        }
    }
    
    class func canLog() -> Bool {
        let config = GTSDKConfig.sharedInstance.getConfiguration()
        return config.logEnabled!
    }
    
    // MARK: - Setup
    
    class func setup(logToConsole: Bool, logToDeviceLogs: Bool, logToFile: Bool, level: DDLogLevel) {
        if logToConsole {
            addLogger(DDTTYLogger.sharedInstance(), level: level) // TTY = Xcode console
        }
        
        if logToDeviceLogs {
            addLogger(DDASLLogger.sharedInstance(), level: level) // ASL = Apple System Logs
        }
        
        if logToFile {
            let fileLogger: DDFileLogger = DDFileLogger() // File Logger
            fileLogger.rollingFrequency = 60*60*24  // 24 hours
            fileLogger.logFileManager.maximumNumberOfLogFiles = 7
            addLogger(fileLogger, level: level)
        }
    }
    
    class func addLogger(logger: DDLogger, level: DDLogLevel) {
        DDLog.addLogger(logger, withLevel: level)
    }
}
