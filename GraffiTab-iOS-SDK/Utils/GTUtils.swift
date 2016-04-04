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
}
