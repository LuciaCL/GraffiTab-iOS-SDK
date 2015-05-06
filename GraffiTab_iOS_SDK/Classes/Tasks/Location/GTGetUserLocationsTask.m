//
//  GTGetUserLocationsTask.m
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 11/12/2014.
//  Copyright (c) 2014 GraffiTab. All rights reserved.
//

#import "GTGetUserLocationsTask.h"

@implementation GTGetUserLocationsTask

- (void)getLocationsWithSuccessBlock:(void (^)(GTResponseObject *))successBlock cacheBlock:(void (^)(GTResponseObject *))cacheBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    self.sBlock = successBlock;
    self.fBlock = failureBlock;
    self.cBlock = cacheBlock;
    
    NSString *string = [GTRequestBuilder buildGetUserLocations];
    
    // Define web request.
    void (^simpleBlock)(void) = ^{
        [self executePostWithUrl:string parameters:nil cachePolicy:NSURLRequestReloadIgnoringLocalCacheData success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSDictionary *responseJson = responseObject;
            
            [self parseJsonSuccess:responseJson];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSHTTPURLResponse *response = operation.response;
            NSInteger statuscode = response.statusCode;
            
            [self parseJsonError:statuscode];
        }];
    };
    
    if (self.isStart) {
        [self executePostWithUrl:string parameters:nil cachePolicy:NSURLRequestReturnCacheDataDontLoad success:^(AFHTTPRequestOperation *operation, id responseObject) {
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
        GTUserLocation *p = [[GTUserLocation alloc] initFromJson:personJson];
        [items addObject:p];
    }
    
    return items;
}

@end
