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

- (void)parseJsonSuccess:(NSDictionary *)json;
- (void)parseJsonCacheSuccess:(NSDictionary *)json;
- (void)parseJsonError:(NSDictionary *)json;
- (id)parseJsonSuccessObject:(NSDictionary *)json;

@end
