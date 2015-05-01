//
//  SearchHashtags.m
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 03/04/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTSearchHashtags.h"

@implementation GTSearchHashtags

- (void)searchHashtagsWithQuery:(NSString *)q offset:(int)start numberOfItems:(int)count successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    self.sBlock = successBlock;
    self.fBlock = failureBlock;
    
    NSString *string = [GTRequestBuilder buildSearchHashtags];
    
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
    
    for (NSString *hashtag in jsonArray)
        [items addObject:hashtag];
    
    return items;
}

@end
