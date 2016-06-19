//
//  GTLinkExternalProviderTask.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 13/05/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class GTLinkExternalProviderTask: GTNetworkTask {
    
    func link(externalProviderType: GTApiExternalProviderType, externalId: String, accessToken: String, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        self.sBlock = successBlock
        self.fBlock = failureBlock
        
        let url = GTRequestBuilder.buildExternalProviderUrl()
        
        let externalProviderParams = ["userId":externalId, "token":accessToken, "type":externalProviderType.rawValue]
        let params = ["externalProvider":externalProviderParams]
        
        return request(.POST, URLString: url, parameters: params, encoding: .JSON, completionHandler: { (response: Response<AnyObject, NSError>) -> Void in
            if (response.result.isFailure) {
                if (response.response == nil) {
                    self.parseJSONError(1)
                }
                else {
                    self.parseJSONError((response.response?.statusCode)!)
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
        
        GTSettings.sharedInstance.user = user
        
        NSNotificationCenter.defaultCenter().postNotificationName(GTEvents.ExternalProviderLinked, object: nil)
        
        return super.parseJSONSuccessObject(JSON)
    }
}
