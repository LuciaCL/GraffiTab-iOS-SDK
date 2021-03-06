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

class GTImportExternalProviderAvatarTask: GTAssetNetworkTask {
    
    func importAvatar(externalProviderType: GTExternalProviderType, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        self.sBlock = successBlock
        self.fBlock = failureBlock
        
        let url = GTRequestBuilder.buildImportExternalProviderAvatarUrl(externalProviderType)
        
        return request(.PUT, URLString: url, parameters: nil, encoding: .JSON, completionHandler: { (response: Response<AnyObject, NSError>) -> Void in
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
                
                // Wait until the asset has finished processing.
                self.awaitAssetProcessingComplete(resp!, completion: { (asset) in
                    self.parseJSONSuccess(asset)
                })
            }
        })
    }
    
    override func parseJSONSuccessObject(JSON: AnyObject) -> AnyObject {
        let asset: GTAsset
        if JSON.isKindOfClass(GTAsset) { // The polling task returns either an asset object or the original asset JSON.
            asset = JSON as! GTAsset
        }
        else {
            asset = Mapper<GTAsset>().map(JSON["asset"])!
        }
        
        let user = GTMeManager.sharedInstance.loggedInUser
        user!.avatar = asset
        GTMeManager.sharedInstance.loggedInUser = user
        
        NSNotificationCenter.defaultCenter().postNotificationName(GTEvents.UserAvatarChanged, object: nil, userInfo: ["user" : user!])
        
        return asset;
    }
}
