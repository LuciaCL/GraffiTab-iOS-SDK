//
//  GTUnlikeStreamableTask.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 11/05/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class GTUnlikeStreamableTask : GTNetworkTask {
    
    func unlike(streamableId: Int, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        self.sBlock = successBlock
        self.fBlock = failureBlock
        
        let url = GTRequestBuilder.buildLikesUrl(streamableId)
        
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
        let item = Mapper<GTStreamable>().map(JSON["streamable"])
        
        NSNotificationCenter.defaultCenter().postNotificationName(GTEvents.StreamableLikesChanged, object: nil, userInfo: ["streamable" : item!])
        
        return item!
    }
}
