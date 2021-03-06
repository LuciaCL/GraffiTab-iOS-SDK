//
//  GTEditProfileTask.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 13/04/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class GTEditProfileTask: GTNetworkTask {
    
    func edit(firstName: String, lastName: String, email: String, about: String?, website: String?, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        self.sBlock = successBlock
        self.fBlock = failureBlock
        
        let url = GTRequestBuilder.buildGetMeUrl()
        
        var userParams = ["firstName":firstName, "lastName":lastName, "email":email]
        if about != nil {
            userParams["about"] = about
        }
        if website != nil {
            userParams["website"] = website
        }
        let params = ["user":userParams]
        
        return request(.PUT, URLString: url, parameters: params, encoding: .JSON, completionHandler: { (response: Response<AnyObject, NSError>) -> Void in
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
        
        NSNotificationCenter.defaultCenter().postNotificationName(GTEvents.UserProfileChanged, object: nil, userInfo: ["user" : user!])
        
        return user!;
    }
}
