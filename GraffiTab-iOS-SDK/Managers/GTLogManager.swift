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

    static var loggingEnabled: Bool = false
    
    public class func setupApplicationLogger(logToConsole: Bool, logToDeviceLogs: Bool, logToFile: Bool) {
        if logToConsole {
            DDLog.addLogger(DDTTYLogger.sharedInstance()) // TTY = Xcode console
        }
        
        if logToDeviceLogs {
            DDLog.addLogger(DDASLLogger.sharedInstance()) // ASL = Apple System Logs
        }
        
        if logToFile {
            let fileLogger: DDFileLogger = DDFileLogger() // File Logger
            fileLogger.rollingFrequency = 60*60*24  // 24 hours
            fileLogger.logFileManager.maximumNumberOfLogFiles = 7
            DDLog.addLogger(fileLogger)
        }
        
        loggingEnabled = true
    }
}
