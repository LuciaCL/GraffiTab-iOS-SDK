//
//  GTEditMessageTask.m
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 04/04/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTEditMessageTask.h"

@implementation GTEditMessageTask

- (void)editMessageWithId:(long)messageId text:(NSString *)text successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    self.sBlock = successBlock;
    self.fBlock = failureBlock;
    
    NSString *string = [GTRequestBuilder buildEditMessage];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{JSON_REQ_MESSAGE_ID:@(messageId),
                                                                                  JSON_REQ_GENERIC_TEXT:text}];
    
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
}

- (id)parseJsonSuccessObject:(NSDictionary *)json {
    GTConversationMessage *p = [[GTConversationMessage alloc] initFromJson:json[JSON_RESP_MESSAGE_MESSAGE]];
    
    return p;
}

@end
