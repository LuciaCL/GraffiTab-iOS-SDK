//
//  GTEditConversationNameTask.m
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 13/04/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTEditConversationNameTask.h"

@implementation GTEditConversationNameTask

- (void)editConversationTitleWithId:(long)conversationId text:(NSString *)text successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    self.sBlock = successBlock;
    self.fBlock = failureBlock;
    
    NSString *string = [GTRequestBuilder buildEditConversationName];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{JSON_REQ_CONVERSATION_ID:@(conversationId),
                                                                                  JSON_REQ_CONVERSATION_TITLE:text}];
    
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
    GTConversation *p = [[GTConversation alloc] initFromJson:json[JSON_RESP_CONVERSATION_CONVERSATION]];
    
    return p;
}

@end
