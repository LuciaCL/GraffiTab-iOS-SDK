//
//  GTImportExternalProviderAvatarTask.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 05/04/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class GTImportExternalProviderAvatarTask: GTNetworkTask {
    
    func importAvatar(externalProviderType: GTApiExternalProviderType, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        self.sBlock = successBlock
        self.fBlock = failureBlock
        
        let url = GTRequestBuilder.buildImportExternalProviderAvatarUrl(externalProviderType)
        
        return request(.PUT, URLString: url, parameters: nil, encoding: .JSON, completionHandler: { (response: Response<AnyObject, NSError>) -> Void in
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
        let asset = Mapper<GTAsset>().map(JSON["asset"])
        
        let user = GTSettings.sharedInstance.user
        user!.avatar = asset
        GTSettings.sharedInstance.user = user
        
        NSNotificationCenter.defaultCenter().postNotificationName(GTEvents.UserAvatarChanged, object: nil)
        
        return asset!;
    }
}
