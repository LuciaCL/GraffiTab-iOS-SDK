//
//  GTNetworkTask.h
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 26/11/2014.
//  Copyright (c) 2014 GraffiTab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GTNetworkTask : NSObject

@property (nonatomic, strong) void (^sBlock)(GTResponseObject *);
@property (nonatomic, strong) void (^cBlock)(GTResponseObject *);
@property (nonatomic, strong) void (^fBlock)(GTResponseObject *error);

- (void)executePostWithUrl:(NSString *)url parameters:(NSDictionary *)parameters cachePolicy:(NSURLRequestCachePolicy)cachePolicy success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

- (void)parseJsonSuccess:(NSDictionary *)json;
- (void)parseJsonCacheSuccess:(NSDictionary *)json;
- (void)parseJsonError:(NSInteger)statusCode;
- (id)parseJsonSuccessObject:(NSDictionary *)json;

@end
