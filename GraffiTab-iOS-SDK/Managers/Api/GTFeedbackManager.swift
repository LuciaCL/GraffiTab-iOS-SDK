//
//  GTFeedbackManager.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 13/04/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit
import Alamofire

public class GTFeedbackManager: NSObject {

    public class func sendFeedback(name: String, email: String, text: String, successBlock: (response: GTResponseObject) -> Void, failureBlock: (response: GTResponseObject) -> Void) -> Request {
        let task = GTSendFeedbackTask()
        return task.sendFeedback(name, email: email, text: text, successBlock: successBlock, failureBlock: failureBlock)
    }
}
