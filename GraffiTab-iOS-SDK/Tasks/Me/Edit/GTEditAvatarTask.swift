//
//  GTEditAvatarTask.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 13/04/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class GTEditAvatarTask: GTAssetNetworkTask {
    
    func edit(image: UIImage, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) {
        self.sBlock = successBlock
        self.fBlock = failureBlock
        
        let url = GTRequestBuilder.buildAvatarUrl()
        
        // Process image before upload.
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            
            // Compress image.
            let fileData = UIImageJPEGRepresentation(image, 0.5)
            
            dispatch_async( dispatch_get_main_queue(), {
                self.multipartFileUploadRequest(.POST, URLString: url, fileData: fileData!, properties: nil, completionHandler: { (response: Response<AnyObject, NSError>) in
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
            })
        });
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
