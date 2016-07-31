//
//  GTSendFeedbackTask.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 13/04/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class GTSendFeedbackTask: GTNetworkTask {
    
    func sendFeedback(name: String, email: String, text: String, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        self.sBlock = successBlock
        self.fBlock = failureBlock
        
        let url = GTRequestBuilder.buildFeedbackUrl()
        
        let feedbackParams = ["name":name, "email":email, "text":text]
        let params = ["feedback":feedbackParams]
        
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
    
    override func parseJSONSuccessObject(JSON: AnyObject) -> AnyObject? {
        NSNotificationCenter.defaultCenter().postNotificationName(GTEvents.FeedbackSent, object: nil)
        
        return super.parseJSONSuccessObject(JSON)
    }
}
