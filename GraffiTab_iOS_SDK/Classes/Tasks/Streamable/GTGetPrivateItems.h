//
//  GTGetPrivateItems.h
//  GraffiTab_iOS_SDK
//
//  Created by Georgi Christov on 05/05/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTNetworkTask.h"

@interface GTGetPrivateItems : GTNetworkTask

@property (nonatomic, assign) BOOL isStart;

- (void)getPrivateItemsWithStart:(int)start numberOfItems:(int)count successBlock:(void (^)(GTResponseObject *))successBlock cacheBlock:(void (^)(GTResponseObject *))cacheBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;

@end
