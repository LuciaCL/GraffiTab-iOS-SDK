//
//  GTResponseObject.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 04/04/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit

public enum GTResult : CustomStringConvertible {
    case Success
    case Error
    
    public var description : String {
        switch self {
            case .Success: return "Success"
            case .Error: return "Error"
        }
    }
}

public enum GTReason : Int, CustomStringConvertible {
    case ServerError = 500
    case AuthorizationNeeded = 401
    case NotFound = 404
    case AlreadyExists = 409
    case Forbidden = 403
    case BadRequest = 400
    case Other = 1
    
    public var description : String {
        switch self {
            case .ServerError: return "ServerError"
            case .AuthorizationNeeded: return "AuthorizationNeeded"
            case .NotFound: return "NotFound"
            case .AlreadyExists: return "AlreadyExists"
            case .Forbidden: return "Forbidden"
            case .BadRequest: return "BadRequest"
            case .Other: return "Other"
        }
    }
}

public class GTResponseObject {

    public var result: GTResult!
    public var reason: GTReason!
    public var message: String!
    public var object: AnyObject!
}
