//
//  GTUtils.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 04/04/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit

public class GTUtils: NSObject {

    public class func dateFromString(date: AnyObject!, format: String) -> NSDate? {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = format
        
        if let dateString = date as? String {
            return dateFormatter.dateFromString(dateString)
        }
        
        return nil
    }
    
    class func runWithDelay(sec: Double, block: (Void) -> Void) {
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(sec * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            block()
        }
    }
}
