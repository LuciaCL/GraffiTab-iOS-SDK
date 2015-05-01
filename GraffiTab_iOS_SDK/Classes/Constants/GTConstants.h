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
    ALREADY_EXISTS,
    DATABASE_ERROR,
    INCORRECT_CREDENTIALS,
    AUTHORIZATION_NEEDED,
    NOT_FOUND,
    NETWORK,
    OTHER
} Reason;

#define RESULT_LIST @[@"SUCCESS", @"ERROR"]
#define REASON_LIST @[@"ALREADY_EXISTS", @"DATABASE_ERROR", @"INCORRECT_CREDENTIALS", @"AUTHORIZATION_NEEDED", @"NOT_FOUND", @"OTHER"]

#define Result(str) (Result)[RESULT_LIST indexOfObject:str]
#define Reason(str) (Reason)[REASON_LIST indexOfObject:str]

#define KEY_LOGGED_IN_USER @"KEY_LOGGED_IN_USER"
#define KEY_TOKEN @"KEY_TOKEN"

#define COMPRESSION_QUALITY 0.7
