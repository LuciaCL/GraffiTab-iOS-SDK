//
//  GTDeleteStreamableTask.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 23/05/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class GTDeleteStreamableTask : GTNetworkTask {
    
    var streamableId: Int?
    
    func delete(streamableId: Int, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        self.sBlock = successBlock
        self.fBlock = failureBlock
        
        self.streamableId = streamableId
        
        let url = GTRequestBuilder.buildStreamableUrl(streamableId)
        
        return request(.DELETE, URLString: url, parameters: nil, encoding: .JSON, completionHandler: { (response: Response<AnyObject, NSError>) -> Void in
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
        NSNotificationCenter.defaultCenter().postNotificationName(GTEvents.StreamableChanged, object: nil, userInfo: ["streamableId" : streamableId!])
        
        return super.parseJSONSuccessObject(JSON)!
    }
}
