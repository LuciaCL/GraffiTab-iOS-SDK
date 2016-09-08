//
//  GTConfig.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 06/07/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit
import CocoaLumberjack

public class GTConfig: NSObject {

    public var logEnabled: Bool?
    public var logLevel: DDLogLevel?
    
    public var domain: String?
    public var httpsEnabled: Bool?
    
    public var language: String? {
        didSet {
            if language == nil { // Make sure there is always a language.
                language = GTConfig.defaultConfig.defaultLanguage
            }
        }
    }
    
    public static let defaultConfig = GTDefaultConfig()
    
    public init(domain: String, logEnabled: Bool, logLevel: DDLogLevel, httpsEnabled: Bool, language: String) {
        self.domain = domain
        self.logEnabled = logEnabled
        self.logLevel = logLevel
        self.httpsEnabled = httpsEnabled
        self.language = language
    }
}
