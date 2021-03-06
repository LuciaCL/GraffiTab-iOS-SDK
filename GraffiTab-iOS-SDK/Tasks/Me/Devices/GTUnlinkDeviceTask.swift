//
//  GTUnlinkDeviceTask.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 21/10/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class GTUnlinkDeviceTask: GTNetworkTask {
    
    func unlinkDevice(token: String, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        self.sBlock = successBlock
        self.fBlock = failureBlock
        
        let url = GTRequestBuilder.buildDeviceUrl()
        
        let deviceParams = ["token":token, "osType":"IOS"]
        let params = ["device":deviceParams]
        
        return request(.DELETE, URLString: url, parameters: params, encoding: .JSON, completionHandler: { (response: Response<AnyObject, NSError>) -> Void in
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
    
    override func parseJSONSuccessObject(JSON: AnyObject) -> AnyObject? {
        NSNotificationCenter.defaultCenter().postNotificationName(GTEvents.DeviceUnlinked, object: nil)
        
        return super.parseJSONSuccessObject(JSON)
    }
}
