//
//  GetMostActiveUsersTask.h
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 04/12/2014.
//  Copyright (c) 2014 GraffiTab. All rights reserved.
//

#import "GTNetworkTask.h"

@interface GTGetMostActiveUsersTask : GTNetworkTask

@property (nonatomic, assign) BOOL isStart;

- (void)getMostActiveUsersWithStart:(int)start numberOfItems:(int)count successBlock:(void (^)(GTResponseObject *))successBlock cacheBlock:(void (^)(GTResponseObject *))cacheBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;

@end
