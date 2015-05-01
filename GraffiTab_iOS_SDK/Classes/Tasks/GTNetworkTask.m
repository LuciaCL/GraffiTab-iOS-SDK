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

- (void)parseJsonError:(NSDictionary *)json {
    GTResponseObject *response = [GTResponseObject new];
    response.result = ERROR;
    
    @try {
        if (!json) {
            response.reason = NETWORK;
            response.message = @"Network error. Please check your connection and try again.";
        }
        else {
            response.reason = Reason(json[JSON_RESP_GENERIC_ERROR_TYPE]);
            response.message = json[JSON_RESP_GENERIC_ERROR_MESSAGE];
        }
    }
    @catch (NSException *exception) {
        response.reason = NETWORK;
        response.message = @"Network error. Please check your connection and try again.";
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
        NSLog(@"ERROR (%@) MESSAGE - %@", REASON_LIST[response.reason], response.message);
        
        self.fBlock(response);
    }
}

- (void)finishCachedRequestWithResponse:(GTResponseObject *)response {
    [GTCookieManager saveCookies];
    
    self.cBlock(response);
}

@end
