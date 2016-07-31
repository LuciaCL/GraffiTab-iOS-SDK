//
//  GTGetSocialFriendsTask.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 20/06/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class GTGetSocialFriendsTask: GTNetworkTask {
    
    func getSocialFriends(offset: Int, limit: Int, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        self.sBlock = successBlock
        self.fBlock = failureBlock
        
        let url = GTRequestBuilder.buildGetSocialFriendsUrl(offset, limit: limit)
        
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
        let listResultItem = Mapper<GTListItemsResult<GTUserSocialFriendsContainer>>().map(JSON)
        listResultItem?.items = Mapper<GTUserSocialFriendsContainer>().mapArray(JSON["items"])
        
        return listResultItem!
    }
}
