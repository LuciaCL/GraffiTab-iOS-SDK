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

    init() {
        super.init(domain: GTApiDomainConstants.DefaultAppDomain, logEnabled: false, logLevel: .Off, httpsEnabled: false)
    }
}
