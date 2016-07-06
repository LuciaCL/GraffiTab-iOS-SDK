//
//  GTAssetManager.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 06/07/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit
import Alamofire

public class GTAssetManager: NSObject {

    public class func getAssetState(guid: String, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTGetAssetStateTask()
        return task.getAssetState(guid, successBlock: successBlock, failureBlock: failureBlock)
    }
}
