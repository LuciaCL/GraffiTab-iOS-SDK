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
        GTSessionManager.manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        
        [GTSessionManager.manager POST:string parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
            NSDictionary *responseJson = responseObject;
            
            [self parseJsonSuccess:responseJson];
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            if (error.userInfo[JSONResponseSerializerWithDataKey]) {
                NSData *data = error.userInfo[JSONResponseSerializerWithDataKey];
                
                NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data
                                                                     options:kNilOptions
                                                                       error:&error];
                
                [self parseJsonError:json];
            }
            else
                [self parseJsonError:nil];
        }];
    };
    
    simpleBlock();
}

@end
