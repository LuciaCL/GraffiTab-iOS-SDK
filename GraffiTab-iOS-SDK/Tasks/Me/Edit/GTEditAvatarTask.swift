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

class GTEditAvatarTask: GTNetworkTask {
    
    func edit(image: UIImage, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) {
        self.sBlock = successBlock
        self.fBlock = failureBlock
        
        let url = GTRequestBuilder.buildAvatarUrl()
        
        // Process image before upload.
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            
            // Compress image.
            let fileData = UIImageJPEGRepresentation(image, 0.5)
            
            dispatch_async( dispatch_get_main_queue(), {
                self.uploadRequest(.PUT, URLString: url, headers: ["Content-Type": "image/jpeg"], data: fileData!, completionHandler: { (response: Response<AnyObject, NSError>) in
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
            })
        });
    }
    
    override func parseJSONSuccessObject(JSON: AnyObject) -> AnyObject {
        let asset = Mapper<GTAsset>().map(JSON["asset"])
        
        let user = GTSettings.sharedInstance.user
        user!.avatar = asset
        GTSettings.sharedInstance.user = user
        
        return asset!;
    }
}
