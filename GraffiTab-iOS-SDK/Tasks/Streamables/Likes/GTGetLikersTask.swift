//
//  GTGetLikersTask.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 10/05/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class GTGetLikersTask: GTNetworkTask {
    
    func getLikers(streamableId: Int, offset: Int, limit: Int, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        self.sBlock = successBlock
        self.fBlock = failureBlock
        
        let url = GTRequestBuilder.buildGetLikersUrl(streamableId, offset: offset, limit: limit)
        
        return request(.GET, URLString: url, parameters: nil, encoding: .JSON, completionHandler: { (response: Response<AnyObject, NSError>) -> Void in
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
        let listResultItem = Mapper<GTListItemsResult<GTUser>>().map(JSON)
        listResultItem?.items = Mapper<GTUser>().mapArray(JSON["items"])
        
        return listResultItem!
    }
}
