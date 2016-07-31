//
//  GTRegisterWithExternalProviderTask.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 05/04/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class GTRegisterWithExternalProviderTask: GTNetworkTask {
    
    func register(externalProviderType: GTExternalProviderType, externalId: String, accessToken: String, email: String, firstName: String, lastName: String, username: String, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        self.sBlock = successBlock
        self.fBlock = failureBlock
        
        let url = GTRequestBuilder.buildRegisterWithExternalProviderUrl()
        
        let userParams = ["username":username, "firstName":firstName, "lastName":lastName, "email":email]
        let params = ["user":userParams, "externalId":externalId, "accessToken":accessToken, "externalProviderType":externalProviderType.rawValue]
        
        return request(.POST, URLString: url, parameters: params as? [String : AnyObject], encoding: .JSON, completionHandler: { (response: Response<AnyObject, NSError>) -> Void in
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
}
