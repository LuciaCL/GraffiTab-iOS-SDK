//
//  GTDeleteAvatarTask.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 13/04/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class GTDeleteAvatarTask: GTNetworkTask {
    
    func delete(successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        self.sBlock = successBlock
        self.fBlock = failureBlock
        
        let url = GTRequestBuilder.buildAvatarUrl()
        
        return request(.DELETE, URLString: url, parameters: nil, encoding: .JSON, completionHandler: { (response: Response<AnyObject, NSError>) -> Void in
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
        let user = GTMeManager.sharedInstance.loggedInUser
        user!.avatar = nil
        GTMeManager.sharedInstance.loggedInUser = user
        
        NSNotificationCenter.defaultCenter().postNotificationName(GTEvents.UserAvatarChanged, object: nil, userInfo: ["user" : user!])
        
        return user!;
    }
}
