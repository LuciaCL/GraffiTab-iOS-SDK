//
//  GTResponseObject.swift
//  GraffiTab-iOS-SDK
//
//  Created by Georgi Christov on 04/04/2016.
//  Copyright © 2016 GraffiTab. All rights reserved.
//

import UIKit

public enum GTReason : String {
    case OK
    
    case UNSUPPORTED_FILE_TYPE
    case INVALID_TOKEN
    case STREAM_COULD_NOT_BE_READ
    case INVALID_ARGUMENT
    case MISSING_ARGUMENT
    case INVALID_JSON
    case INVALID_FOLLOWEE
    case EMPTY_MANDATORY_FIELD
    case INVALID_USERNAME
    case INVALID_EMAIL
    case USERNAME_ALREADY_IN_USE
    case EMAIL_ALREADY_IN_USE
    case INVALID_ID
    
    case USER_NOT_LOGGED_IN
    case USER_NOT_OWNER
    
    case INCORRECT_PASSWORD
    case MAXIMUM_LOGIN_ATTEMPTS
    case FORBIDDEN_RESOURCE
    
    case EXTERNAL_PROVIDER_NOT_FOUND
    case EXTERNAL_PROVIDER_NOT_LINKED
    case DEVICE_NOT_FOUND
    case USER_NOT_FOUND
    case ASSET_NOT_FOUND
    case STREAMABLE_NOT_FOUND
    case COMMENT_NOT_FOUND
    case LOCATION_NOT_FOUND
    case TOKEN_NOT_FOUND
    
    case TOKEN_EXPIRED
    case USER_NOT_IN_EXPECTED_STATE
    
    case DEVICE_ALREADY_EXISTS
    case EXTERNAL_PROVIDER_ALREADY_LINKED
    
    case GENERAL_ERROR
    
    case OTHER
}

public class GTError {
    public var reason: GTReason!
    public var statusCode: Int!
    public var message: String!
}

public class GTResponseObject {
    public var error: GTError!
    public var object: AnyObject!
    public var url: String!
}
