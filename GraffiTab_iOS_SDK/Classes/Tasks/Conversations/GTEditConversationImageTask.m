//
//  GTEditConversationImageTask.m
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 14/04/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTEditConversationImageTask.h"

@implementation GTEditConversationImageTask

- (void)editConversationImageWithConversationId:(long)conversationId image:(UIImage *)image successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    self.sBlock = successBlock;
    self.fBlock = failureBlock;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString *string = [GTRequestBuilder buildEditConversationImage];
        
        NSString *encodedString;
        if (image) {
            NSData *imageData = UIImageJPEGRepresentation(image, COMPRESSION_QUALITY);
            encodedString = [imageData base64EncodedStringWithOptions:0];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{JSON_REQ_CONVERSATION_ID:@(conversationId)}];
            
            if (encodedString)
                params[JSON_REQ_GENERIC_ENCODED_IMAGE] = encodedString;
            
            GTSessionManager.manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
            
            [GTSessionManager.manager POST:string parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
                NSDictionary *responseJson = responseObject;
                
                [self parseJsonSuccess:responseJson];
            } failure:^(NSURLSessionDataTask *task, NSError *error) {
                NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
                NSInteger statuscode = response.statusCode;
                
                [self parseJsonError:statuscode];
            }];
        });
    });
}

- (id)parseJsonSuccessObject:(NSDictionary *)json {
    GTConversation *p = [[GTConversation alloc] initFromJson:json[JSON_RESP_CONVERSATION_CONVERSATION]];
    
    return p;
}

@end
