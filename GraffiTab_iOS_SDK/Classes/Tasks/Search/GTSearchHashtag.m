//
//  SearchHashtag.m
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 14/04/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTSearchHashtag.h"

@implementation GTSearchHashtag

- (void)searchHashtagWithQuery:(NSString *)q offset:(int)start numberOfItems:(int)count successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    self.sBlock = successBlock;
    self.fBlock = failureBlock;
    
    NSString *string = [GTRequestBuilder buildSearchHashtag];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{JSON_REQ_GENERIC_QUERY:q,
                                                                                  JSON_REQ_GENERIC_OFFSET:@(start),
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
