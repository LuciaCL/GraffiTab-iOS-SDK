//
//  GTCreateLocationTask.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 23/05/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class GTCreateLocationTask : GTNetworkTask {
    
    func create(address: String, latitude: Double, longitude: Double, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        self.sBlock = successBlock
        self.fBlock = failureBlock
        
        let url = GTRequestBuilder.buildLocationsUrl()
        
        let locationParams = ["address":address, "latitude":latitude, "longitude":longitude]
        let params = ["location":locationParams]
        
        return request(.POST, URLString: url, parameters: params, encoding: .JSON, completionHandler: { (response: Response<AnyObject, NSError>) -> Void in
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
        let item = Mapper<GTLocation>().map(JSON["location"])
        
        NSNotificationCenter.defaultCenter().postNotificationName(GTEvents.LocationCreated, object: nil, userInfo: ["location" : item!])
        
        return item!
    }
}
