//
//  GTUnlinkExternalProfiverTask.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 13/05/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class GTUnlinkExternalProviderTask: GTNetworkTask {
    
    func unlink(externalProviderType: GTExternalProviderType, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        self.sBlock = successBlock
        self.fBlock = failureBlock
        
        let url = GTRequestBuilder.buildExternalProviderUrl()
        
        let params = ["type":externalProviderType.rawValue]
        
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
        let user = Mapper<GTUser>().map(JSON["user"])
        
        GTMeManager.sharedInstance.loggedInUser = user
        
        NSNotificationCenter.defaultCenter().postNotificationName(GTEvents.ExternalProviderUnlinked, object: nil)
        
        return super.parseJSONSuccessObject(JSON)
    }
}
