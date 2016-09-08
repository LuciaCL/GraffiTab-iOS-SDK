//
//  GTDefaultConfig.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 06/07/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit
import CocoaLumberjack

public class GTDefaultConfig: GTConfig {

    public var defaultLogEnabled   = false
    public var defaultLogLevel     = DDLogLevel.Off
    
    public var defaultDomain       = GTApiDomainConstants.DefaultAppDomain
    public var defaultHttpsEnabled = true
    
    public var defaultLanguage     = "en"
    
    init() {
        super.init(domain: defaultDomain,
                   logEnabled: defaultLogEnabled,
                   logLevel: defaultLogLevel,
                   httpsEnabled: defaultHttpsEnabled,
                   language: defaultLanguage)
    }
}
