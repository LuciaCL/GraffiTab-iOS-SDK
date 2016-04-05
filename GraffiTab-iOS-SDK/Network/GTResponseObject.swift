//
//  GTResponseObject.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 04/04/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit

public enum GTResult {
    case Success
    case Error
}

public enum GTReason : Int, CustomStringConvertible {
    case Other               = 1
    case BadRequest          = 400
    case AuthorizationNeeded = 401
    case Forbidden           = 403
    case NotFound            = 404
    case NotAcceptable       = 406
    case AlreadyExists       = 409
    case ServerError         = 500
    
    public var description : String {
        switch self {
            case .BadRequest:          return "Bad request."
            case .AuthorizationNeeded: return "You need to be logged in to make this request."
            case .Forbidden:           return "The request is forbidden."
            case .NotFound:            return "This item was not found."
            case .NotAcceptable:       return "This action is not allowed."
            case .AlreadyExists:       return "This item already exists."
            case .ServerError:         return "Oups, seems like something went wrong on our server. Please contact support to report this issue."
            case .Other:               return "We could not process your request right now. Please check your connection and try again or contact Support to report this issue."
        }
    }
}

public class GTResponseObject {

    public var result: GTResult!
    public var reason: GTReason!
    public var message: String!
    public var object: AnyObject!
}
