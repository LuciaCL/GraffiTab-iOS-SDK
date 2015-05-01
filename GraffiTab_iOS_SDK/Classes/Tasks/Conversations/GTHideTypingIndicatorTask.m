//
//  GTHideTypingIndicatorTask.m
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 07/04/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTHideTypingIndicatorTask.h"

@implementation GTHideTypingIndicatorTask

- (void)hideTypingIndicatorForConversationId:(long)conversationId successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    self.sBlock = successBlock;
    self.fBlock = failureBlock;
    
    NSString *string = [GTRequestBuilder buildHideTypingIndicator];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{JSON_REQ_CONVERSATION_ID:@(conversationId)}];
    
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
