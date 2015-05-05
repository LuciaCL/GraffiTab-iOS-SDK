//
//  GTConstants.h
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 10/18/13.
//  Copyright (c) 2013 GraffiTab. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    SUCCESS,
    ERROR
} Result;

typedef enum {
    SERVER_ERROR,
    AUTHORIZATION_NEEDED,
    NOT_FOUND,
    ALREADY_EXISTS,
    OTHER
} Reason;

#define KEY_LOGGED_IN_USER @"KEY_LOGGED_IN_USER"
#define KEY_TOKEN @"KEY_TOKEN"

#define COMPRESSION_QUALITY 0.7
