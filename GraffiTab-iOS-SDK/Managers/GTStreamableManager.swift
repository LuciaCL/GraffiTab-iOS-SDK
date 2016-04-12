//
//  GTStreamableManager.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 08/04/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit
import Alamofire

public class GTStreamableManager: NSObject {
    
    public class func getPopular(offset: Int = 0, limit: Int = GTConstants.MaxItems, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTGetPopularTask()
        return task.getPopular(offset, limit: limit, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func getNewest(offset: Int = 0, limit: Int = GTConstants.MaxItems, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTGetNewestTask()
        return task.getNewest(offset, limit: limit, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func searchForLocation(neLatitude: Double, neLongitude: Double, swLatitude: Double, swLongitude: Double, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTSearchStreamablesForLocationTask()
        return task.searchForLocation(neLatitude, neLongitude: neLongitude, swLatitude: swLatitude, swLongitude: swLongitude, successBlock: successBlock, failureBlock: failureBlock)
    }
    
    public class func searchForHashtag(query: String = "", offset: Int = 0, limit: Int = GTConstants.MaxItems, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTSearchStreamablesForHashtagTask()
        return task.search(query, offset: offset, limit: limit, successBlock: successBlock, failureBlock: failureBlock)
    }
}
