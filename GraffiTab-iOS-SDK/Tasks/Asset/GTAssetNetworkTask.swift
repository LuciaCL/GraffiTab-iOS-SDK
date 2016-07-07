//
//  GTAssetNetworkTask.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 06/07/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit
import ObjectMapper

class GTAssetNetworkTask: GTNetworkTask {

    var retries = 10
    var attempts = 0
    
    func awaitAssetProcessingComplete(originalJSON: AnyObject, completion: (asset: GTAsset) -> Void) {
        let asset = Mapper<GTAsset>().map(originalJSON["asset"])
        
        if attempts < retries {
            GTUtils.runWithDelay(1) {
                GTLog.logDebug(GTLogConstants.Tag, message: "Checking asset state - \(asset?.guid!)", forceLog: false)
                
                GTAssetManager.getAssetState(asset!.guid!, successBlock: { (response) in
                    let polledAsset = response.object as! GTAsset
                    
                    if polledAsset.state == GTAssetState.COMPLETED {
                        GTLog.logDebug(GTLogConstants.Tag, message: "Asset \(asset?.guid!) finished processing after \(self.attempts) tries", forceLog: false)
                        completion(asset: polledAsset)
                    }
                    else {
                        self.awaitAssetProcessingComplete(originalJSON, completion: completion)
                    }
                }) { (response) in
                    GTLog.logError(GTLogConstants.Tag, message: "Failed to poll for asset state - \(response.message)", forceLog: true)
                    self.awaitAssetProcessingComplete(originalJSON, completion: completion)
                }
                
                self.attempts += 1
            }
        }
        else {
            GTLog.logError(GTLogConstants.Tag, message: "Asset didn't finish processing after \(retries) tries. Aborting", forceLog: true)
            completion(asset: asset!)
        }
    }
}
