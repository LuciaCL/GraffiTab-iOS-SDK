//
//  GTGetMessagesTask.m
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 10/12/2014.
//  Copyright (c) 2014 GraffiTab. All rights reserved.
//

#import "GTGetMessagesTask.h"

@implementation GTGetMessagesTask

- (void)getMessagesWithConversationId:(long)conversationId start:(int)start numberOfItems:(int)count successBlock:(void (^)(GTResponseObject *))successBlock cacheBlock:(void (^)(GTResponseObject *))cacheBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    self.sBlock = successBlock;
    self.fBlock = failureBlock;
    self.cBlock = cacheBlock;
    
    NSString *string = [GTRequestBuilder buildGetMessages];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{JSON_REQ_CONVERSATION_ID:@(conversationId),
                                                                                  JSON_REQ_GENERIC_OFFSET:@(start),
                                                                                  JSON_REQ_GENERIC_NUM_ITEMS:@(count)}];
    
    // Add cache id to url.
    string = [NSString stringWithFormat:@"%@?id=%li", string, conversationId];
    
    // Define web request.
    void (^simpleBlock)(void) = ^{
        [self executePostWithUrl:string parameters:params cachePolicy:NSURLRequestReloadIgnoringLocalCacheData success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSDictionary *responseJson = responseObject;
            
            [self parseJsonSuccess:responseJson];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSHTTPURLResponse *response = operation.response;
            NSInteger statuscode = response.statusCode;
            
            [self parseJsonError:statuscode];
        }];
    };
    
    if (self.isStart) {
        [self executePostWithUrl:string parameters:params cachePolicy:NSURLRequestReturnCacheDataDontLoad success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSDictionary *responseJson = responseObject;
            
            [self parseJsonCacheSuccess:responseJson];
            
            // Load second request.
            simpleBlock();
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            simpleBlock();
        }];
    }
    else
        simpleBlock();
}

- (id)parseJsonSuccessObject:(NSDictionary *)json {
    NSArray *jsonArray = json[JSON_RESP_GENERIC_ITEMS];
    
    NSMutableArray *items = [NSMutableArray new];
    
    for (NSDictionary *personJson in jsonArray) {
        GTConversationMessage *p = [[GTConversationMessage alloc] initFromJson:personJson];
        [items addObject:p];
    }
    
    return items;
}

@end
