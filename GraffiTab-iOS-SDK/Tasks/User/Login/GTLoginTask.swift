//
//  GTLoginTask.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 04/04/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class GTLoginTask: GTNetworkTask {

    func login(email: String, password: String, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        self.sBlock = successBlock
        self.fBlock = failureBlock
        
        let url = GTRequestBuilder.buildLoginUrl()
        
        let params = ["email":email, "password":password]
        
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
                // At this point login was successful and the cookies are saved, so load the user.
                let resp = response.result.value
                
                self.parseJSONSuccess(resp!)
            }
        })
    }
    
    override func parseJSONSuccessObject(JSON: AnyObject) -> AnyObject {
        let user = Mapper<GTUser>().map(JSON)
        
        GTSettings.sharedInstance.user = user
        
        GTCookieManager.saveCookies()
        
        return user!;
    }
}