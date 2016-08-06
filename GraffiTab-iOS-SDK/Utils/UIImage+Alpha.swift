//
//  UIImage+Alpha.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 06/08/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit

extension UIImage {

    func hasApha() -> Bool {
        let alpha = CGImageGetAlphaInfo(self.CGImage)
        switch alpha {
        case .First, .Last, .PremultipliedFirst, .PremultipliedLast, .Only:
            return true
        case .None, .NoneSkipFirst, .NoneSkipLast:
            return false
        }
    }
}
