//
//  GTLogManager.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 06/06/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit
import CocoaLumberjack

public class GTLogManager: NSObject {

    public class func setupApplicationLogger(logToConsole: Bool, logToDeviceLogs: Bool, logToFile: Bool, level: DDLogLevel) {
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
    
    public class func addLogger(logger: DDLogger, level: DDLogLevel) {
        DDLog.addLogger(logger, withLevel: level)
    }
}
