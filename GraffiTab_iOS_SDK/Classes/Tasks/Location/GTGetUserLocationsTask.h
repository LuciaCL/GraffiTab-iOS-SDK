//
//  GTGetUserLocationsTask.h
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 11/12/2014.
//  Copyright (c) 2014 GraffiTab. All rights reserved.
//

#import "GTNetworkTask.h"

@interface GTGetUserLocationsTask : GTNetworkTask

@property (nonatomic, assign) BOOL isStart;

- (void)getLocationsWithSuccessBlock:(void (^)(GTResponseObject *))successBlock cacheBlock:(void (^)(GTResponseObject *))cacheBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;

@end
