//
//  GTActivityManager.m
//  GraffiTab_iOS_SDK
//
//  Created by Georgi Christov on 08/05/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTActivityManager.h"
#import "GTGetActivityTask.h"

@implementation GTActivityManager

+ (void)getActivityWithGroupItemsCount:(int)groupItemsCount start:(int)start numberOfItems:(int)count useCache:(BOOL)useCache successBlock:(void (^)(GTResponseObject *))successBlock cacheBlock:(void (^)(GTResponseObject *))cacheBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTGetActivityTask *task = [GTGetActivityTask new];
    task.isStart = useCache;
    [task getActivityWithGroupItemsCount:groupItemsCount start:start numberOfItems:count successBlock:successBlock cacheBlock:cacheBlock failureBlock:failureBlock];
}

@end
