//
//  NetworkTask.m
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 26/11/2014.
//  Copyright (c) 2014 GraffiTab. All rights reserved.
//

#import "GTNetworkTask.h"

@implementation GTNetworkTask

- (id)init {
    self = [super init];
    
    if (self) {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    }
    
    return self;
}

- (void)parseJsonSuccess:(NSDictionary *)json {
    GTResponseObject *response = [GTResponseObject new];
    response.result = SUCCESS;
    response.object = [self parseJsonSuccessObject:json];
    
    [self finishRequestWithResponse:response];
}

- (void)parseJsonCacheSuccess:(NSDictionary *)json {
    GTResponseObject *response = [GTResponseObject new];
    response.result = SUCCESS;
    response.object = [self parseJsonSuccessObject:json];
    
    [self finishCachedRequestWithResponse:response];
}

- (void)parseJsonError:(NSInteger)statusCode {
    GTResponseObject *response = [GTResponseObject new];
    response.result = ERROR;
    
    switch (statusCode) {
        case 500:
            response.reason = SERVER_ERROR;
            response.message = @"Oups, seems like something went wrong on our server. Please contact support to report this issue.";
            break;
        case 401:
            response.reason = AUTHORIZATION_NEEDED;
            response.message = @"You need to be logged in to make this request.";
            break;
        case 404:
            response.reason = NOT_FOUND;
            response.message = @"This item was not found.";
            break;
        case 409:
            response.reason = ALREADY_EXISTS;
            response.message = @"This item already exists.";
            break;
        default:
            response.reason = OTHER;
            response.message = @"We could not process your request right now. Please check your connection and try ahain or contact Support to report this issue.";
            break;
    }

    [self finishRequestWithResponse:response];
}

- (id)parseJsonSuccessObject:(NSDictionary *)json {
    return nil;
}

- (void)finishRequestWithResponse:(GTResponseObject *)response {
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    
    [GTCookieManager saveCookies];
    
    if (response.result == SUCCESS)
        self.sBlock(response);
    else {
        NSLog(@"ERROR (%u)", response.reason);
        
        self.fBlock(response);
    }
}

- (void)finishCachedRequestWithResponse:(GTResponseObject *)response {
    [GTCookieManager saveCookies];
    
    self.cBlock(response);
}

@end
