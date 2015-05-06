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

#pragma mark - Request execution

- (void)executePostWithUrl:(NSString *)url parameters:(NSDictionary *)parameters cachePolicy:(NSURLRequestCachePolicy)cachePolicy success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure {
    NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];
    NSDictionary *sheaders = [NSHTTPCookie requestHeaderFieldsWithCookies:cookies];
    
    NSString *charset = (NSString *)CFStringConvertEncodingToIANACharSetName(CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:cachePolicy timeoutInterval:60.f];
    
    [request setHTTPMethod:@"POST"];
    [request setValue:[NSString stringWithFormat:@"application/json; charset=%@", charset] forHTTPHeaderField:@"Content-Type"];
    [request setAllHTTPHeaderFields:sheaders];
    NSURLRequest *r = [[AFJSONRequestSerializer serializer] requestBySerializingRequest:request withParameters:parameters error:nil];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:r];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:success failure:failure];
    
    [operation start];
}

#pragma mark - Response parsing

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
        case 403:
            response.reason = FORBIDDEN;
            response.message = @"The request is forbidden.";
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
        NSLog(@"ERROR (%u) MESSAGE (%@)", response.reason, response.message);
        
        self.fBlock(response);
    }
}

- (void)finishCachedRequestWithResponse:(GTResponseObject *)response {
    [GTCookieManager saveCookies];
    
    self.cBlock(response);
}

@end
