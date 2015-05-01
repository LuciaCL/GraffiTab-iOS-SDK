//
//  GTNotificationManager.m
//  GraffiTabiOSSDK
//
//  Created by Georgi Christov on 29/04/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTNotificationManager.h"
#import "GTGetNotificationsTask.h"
#import "GTGetUnseenNotificationsTask.h"

@implementation GTNotificationManager

+ (void)getNotificationsWithStart:(int)start numberOfItems:(int)count useCache:(BOOL)useCache successBlock:(void (^)(GTResponseObject *))successBlock cacheBlock:(void (^)(GTResponseObject *))cacheBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTGetNotificationsTask *task = [GTGetNotificationsTask new];
    task.isStart = useCache;
    [task getNotificationsWithStart:start numberOfItems:count successBlock:successBlock cacheBlock:cacheBlock failureBlock:failureBlock];
}

+ (void)getUnseenNotificationsWithSuccessBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTGetUnseenNotificationsTask *task = [GTGetUnseenNotificationsTask new];
    [task getUnseenNotificationsWithSuccessBlock:successBlock failureBlock:failureBlock];
}

@end
