//
//  GTSearchStreamablesForLocationTask.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 08/04/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class GTSearchStreamablesForLocationTask: GTNetworkTask {
    
    func searchForLocation(neLatitude: Double, neLongitude: Double, swLatitude: Double, swLongitude: Double, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        self.sBlock = successBlock
        self.fBlock = failureBlock
        
        let url = GTRequestBuilder.buildSearchStreamablesForLocationUrl(neLatitude, neLongitude: neLongitude, swLatitude: swLatitude, swLongitude: swLongitude)
        
        return request(.GET, URLString: url, parameters: nil, encoding: .JSON, completionHandler: { (response: Response<AnyObject, NSError>) -> Void in
            if (response.result.isFailure) {
                if (response.response == nil) {
                    self.parseJSONError(nil)
                }
                else {
                    self.parseJSONError(response)
                }
            }
            else {
                let resp = response.result.value
                
                self.parseJSONSuccess(resp!)
            }
        })
    }
    
    override func parseJSONSuccessObject(JSON: AnyObject) -> AnyObject {
        let listResultItem = Mapper<GTListItemsResult<GTStreamable>>().map(JSON)
        listResultItem?.items = Mapper<GTStreamable>().mapArray(JSON["items"])
        
        return listResultItem!
    }
}