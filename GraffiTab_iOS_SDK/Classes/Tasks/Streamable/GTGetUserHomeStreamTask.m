//
//  GetUserHomeStreamTask.m
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 06/12/2014.
//  Copyright (c) 2014 GraffiTab. All rights reserved.
//

#import "GTGetUserHomeStreamTask.h"

@implementation GTGetUserHomeStreamTask

- (void)getUserHomeStreamWithStart:(int)start numberOfItems:(int)count successBlock:(void (^)(GTResponseObject *))successBlock cacheBlock:(void (^)(GTResponseObject *))cacheBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    self.sBlock = successBlock;
    self.fBlock = failureBlock;
    self.cBlock = cacheBlock;
    
    NSString *string = [GTRequestBuilder buildGetUserHomeStreamItems];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{JSON_REQ_GENERIC_OFFSET:@(start),
                                                                                  JSON_REQ_GENERIC_NUM_ITEMS:@(count)}];
    
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
    
    if (self.isStart) {
        GTSessionManager.manager.requestSerializer.cachePolicy = NSURLRequestReturnCacheDataDontLoad;
        
        [GTSessionManager.manager POST:string parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
            NSDictionary *responseJson = responseObject;
            
            [self parseJsonCacheSuccess:responseJson];
            
            // Load second request.
            simpleBlock();
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            simpleBlock();
        }];
    }
    else
        simpleBlock();
}

- (id)parseJsonSuccessObject:(NSDictionary *)json {
    NSArray *jsonArray = json[JSON_RESP_GENERIC_ITEMS];
    
    NSMutableArray *items = [NSMutableArray new];
    
    for (NSDictionary *itemJson in jsonArray) {
        GTStreamable *n = [GTStreamableFactory createStreamableFromJson:itemJson];
        
        [items addObject:n];
    }
    
    return items;
}

@end
