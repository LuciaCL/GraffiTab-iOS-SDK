//
//  GTDeleteCommentTask.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 11/05/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class GTDeleteCommentTask : GTNetworkTask {
    
    var commentId: Int?
    
    func deleteComment(streamableId: Int, commentId: Int, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        self.sBlock = successBlock
        self.fBlock = failureBlock
        
        self.commentId = commentId
        
        let url = GTRequestBuilder.buildEditCommentUrl(streamableId, commentId: commentId)
        
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
    
    override func parseJSONSuccessObject(JSON: AnyObject) -> AnyObject? {
        NSNotificationCenter.defaultCenter().postNotificationName(GTEvents.CommentDeleted, object: nil, userInfo: ["commentId" : commentId!])
        
        return super.parseJSONSuccessObject(JSON)!
    }
}
