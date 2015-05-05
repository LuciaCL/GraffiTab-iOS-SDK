//
//  GTSendFeedback.m
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 26/04/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTSendFeedback.h"

@implementation GTSendFeedback

- (void)postFeedbackWithText:(NSString *)text successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    self.sBlock = successBlock;
    self.fBlock = failureBlock;
    
    NSString *string = [GTRequestBuilder buildPostFeedback];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{JSON_REQ_FEEDBACK_NAME:[GTSettings getInstance].user.fullName,
                                                                                  JSON_REQ_GENERIC_EMAIL:[GTSettings getInstance].user.email,
                                                                                  JSON_REQ_GENERIC_TEXT:text}];
    
    // Define web request.
    void (^simpleBlock)(void) = ^{
        // Setup and fire off request.
        NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];
        NSDictionary *sheaders = [NSHTTPCookie requestHeaderFieldsWithCookies:cookies];
        
        NSString *charset = (NSString *)CFStringConvertEncodingToIANACharSetName(CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:string] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:60.f];
        
        [request setHTTPMethod:@"POST"];
        [request setValue:[NSString stringWithFormat:@"application/json; charset=%@", charset] forHTTPHeaderField:@"Content-Type"];
        [request setAllHTTPHeaderFields:sheaders];
        NSURLRequest *r = [[AFJSONRequestSerializer serializer] requestBySerializingRequest:request withParameters:params error:nil];
        
        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:r];
        operation.responseSerializer = [AFJSONResponseSerializer serializer];
        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSDictionary *responseJson = responseObject;
            
            [self parseJsonSuccess:responseJson];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSHTTPURLResponse *response = operation.response;
            NSInteger statuscode = response.statusCode;
            
            [self parseJsonError:statuscode];
        }];
        
        [operation start];
    };
    
    simpleBlock();
}

@end
