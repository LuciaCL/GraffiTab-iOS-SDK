//
//  GetLikersTask.m
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 11/12/2014.
//  Copyright (c) 2014 GraffiTab. All rights reserved.
//

#import "GTGetLikersTask.h"

@implementation GTGetLikersTask

- (void)getLikersWithItemId:(long)itemId start:(int)start numberOfItems:(int)count successBlock:(void (^)(GTResponseObject *))successBlock cacheBlock:(void (^)(GTResponseObject *))cacheBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    self.sBlock = successBlock;
    self.fBlock = failureBlock;
    self.cBlock = cacheBlock;
    
    NSString *string = [GTRequestBuilder buildGetLikers];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{JSON_REQ_STREAMABLE_ID:@(itemId),
                                                                                  JSON_REQ_GENERIC_OFFSET:@(start),
                                                                                  JSON_REQ_GENERIC_NUM_ITEMS:@(count)}];
    
    // Define web request.
    void (^simpleBlock)(void) = ^{
        GTSessionManager.manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        
        [GTSessionManager.manager POST:string parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
            NSDictionary *responseJson = responseObject;
            
            [self parseJsonSuccess:responseJson];
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
            NSInteger statuscode = response.statusCode;
            
            [self parseJsonError:statuscode];
        }];
    };
    
    simpleBlock();
}

- (id)parseJsonSuccessObject:(NSDictionary *)json {
    NSArray *jsonArray = json[JSON_RESP_GENERIC_ITEMS];
    
    NSMutableArray *items = [NSMutableArray new];
    
    for (NSDictionary *personJson in jsonArray) {
        GTPerson *p = [[GTPerson alloc] initFromJson:personJson];
        [items addObject:p];
    }
    
    return items;
}

@end
