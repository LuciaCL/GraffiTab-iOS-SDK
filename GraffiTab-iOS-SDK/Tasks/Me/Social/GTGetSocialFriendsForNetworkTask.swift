//
//  GTGetSocialFriendsForNetworkTask.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 20/06/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class GTGetSocialFriendsForNetworkTask: GTNetworkTask {
    
    func getSocialFriends(type: GTExternalProviderType, offset: Int, limit: Int, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        self.sBlock = successBlock
        self.fBlock = failureBlock
        
        let url = GTRequestBuilder.buildGetSocialFriendsForNetworkUrl(type, offset: offset, limit: limit)
        
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
        let socialContainer = Mapper<GTUserSocialFriendsContainer>().map(JSON)
        socialContainer?.users = Mapper<GTUser>().mapArray(JSON["users"])
        
        let listItemsResult = GTListItemsResult<GTUser>(Map(mappingType: .FromJSON, JSONDictionary: [:]))
        listItemsResult?.items = socialContainer?.users
        listItemsResult?.offset = socialContainer?.offset
        listItemsResult?.limit = socialContainer?.limit
        
        return listItemsResult!
    }
}
