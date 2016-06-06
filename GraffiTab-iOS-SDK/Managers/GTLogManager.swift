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
            DDLog.addLogger(DDTTYLogger.sharedInstance(), withLevel: level) // TTY = Xcode console
        }
        
        if logToDeviceLogs {
            DDLog.addLogger(DDASLLogger.sharedInstance(), withLevel: level) // ASL = Apple System Logs
        }
        
        if logToFile {
            let fileLogger: DDFileLogger = DDFileLogger() // File Logger
            fileLogger.rollingFrequency = 60*60*24  // 24 hours
            fileLogger.logFileManager.maximumNumberOfLogFiles = 7
            DDLog.addLogger(fileLogger, withLevel: level)
        }
    }
}
