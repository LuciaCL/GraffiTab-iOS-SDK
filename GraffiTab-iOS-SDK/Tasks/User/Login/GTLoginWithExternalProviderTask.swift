//
//  GTLoginWithExternalProviderTask.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 04/04/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class GTLoginWithExternalProviderTask: GTNetworkTask {
    
    func login(externalProviderType: GTExternalProviderType, externalId: String, accessToken: String, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        self.sBlock = successBlock
        self.fBlock = failureBlock
        
        let url = GTRequestBuilder.buildLoginWithExternalProviderUrl()
        
        let externalProviderParams = ["externalId":externalId, "accessToken":accessToken, "externalProviderType":externalProviderType.rawValue]
        let params = ["externalProvider":externalProviderParams]
        
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
        let user = Mapper<GTUser>().map(JSON["user"])
        
        GTMeManager.sharedInstance.loggedInUser = user
        
        GTCookieManager.saveCookies()
        
        return user!;
    }
}
