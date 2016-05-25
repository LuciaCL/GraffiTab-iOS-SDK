//
//  GTEditStreamableGraffitiTask.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 23/05/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class GTEditStreamableGraffitiTask: GTNetworkTask {
    
    func edit(streamableId: Int, image: UIImage, pitch: CGFloat, roll: CGFloat, yaw: CGFloat, latitude: Double, longitude: Double, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) {
        self.sBlock = successBlock
        self.fBlock = failureBlock
        
        let url = GTRequestBuilder.buildStreamablesGraffitUrl(streamableId)
        
        // Process image before upload.
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            
            // Compress image.
            let fileData = UIImagePNGRepresentation(image)
            
            let graffitiParams = ["latitude":latitude, "longitude":longitude, "roll":roll, "pitch":pitch, "yaw":yaw]
            
            dispatch_async( dispatch_get_main_queue(), {
                
                self.uploadGraffitiRequest(.POST, URLString: url, graffiti: fileData!, properties: graffitiParams as? [String : AnyObject], completionHandler: { (response: Response<AnyObject, NSError>) in
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
        let streamable = Mapper<GTStreamable>().map(JSON["streamable"])
        
        NSNotificationCenter.defaultCenter().postNotificationName(GTEvents.StreamableChanged, object: nil, userInfo: ["streamable" : streamable!])
        
        return streamable!;
    }
}
