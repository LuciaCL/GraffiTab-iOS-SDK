//
//  GTPostCommentTask.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 11/05/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class GTPostCommentTask : GTNetworkTask {
    
    func postComment(streamableId: Int, text: String, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        self.sBlock = successBlock
        self.fBlock = failureBlock
        
        let url = GTRequestBuilder.buildPostCommentUrl(streamableId)
        
        let commentParams = ["text":text]
        let params = ["comment":commentParams]
        
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
    
    override func parseJSONSuccessObject(JSON: AnyObject) -> AnyObject {
        let item = Mapper<GTComment>().map(JSON["comment"])
        
        NSNotificationCenter.defaultCenter().postNotificationName(GTEvents.CommentPosted, object: nil, userInfo: ["comment" : item!])
        
        return item!
    }
}
