//
//  GTGetUserMentionsTask.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 19/09/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class GTGetUserMentionsTask: GTNetworkTask {
    
    func getMentions(userId: Int, offset: Int, limit: Int, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        self.sBlock = successBlock
        self.fBlock = failureBlock
        
        let url = GTRequestBuilder.buildGetUserMentionsUrl(userId, offset: offset, limit: limit)
        
        return request(.GET, URLString: url, parameters: nil, encoding: .JSON, completionHandler: { (response: Response<AnyObject, NSError>) -> Void in
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
        let listResultItem = Mapper<GTListItemsResult<GTStreamable>>().map(JSON)
        listResultItem?.items = Mapper<GTStreamable>().mapArray(JSON["items"])
        
        return listResultItem!
    }
}
