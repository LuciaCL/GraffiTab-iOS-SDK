//
//  GTLocationManager.m
//  GraffiTabiOSSDK
//
//  Created by Georgi Christov on 29/04/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTLocationManager.h"
#import "GTCreateUserLocationTask.h"
#import "GTDeleteUserLocationsTask.h"
#import "GTGetUserLocationsTask.h"

@implementation GTLocationManager

+ (void)createLocationWithPlacemark:(CLPlacemark *)placemark successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTCreateUserLocationTask *task = [GTCreateUserLocationTask new];
    [task createLocationWithPlacemark:placemark successBlock:successBlock failureBlock:failureBlock];
}

+ (void)deleteLocations:(NSMutableArray *)locationIds successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTDeleteUserLocationsTask *task = [GTDeleteUserLocationsTask new];
    [task deleteLocations:locationIds successBlock:successBlock failureBlock:failureBlock];
}

+ (void)getLocationsWithCache:(BOOL)useCache successBlock:(void (^)(GTResponseObject *))successBlock cacheBlock:(void (^)(GTResponseObject *))cacheBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTGetUserLocationsTask *task = [GTGetUserLocationsTask new];
    task .isStart = useCache;
    [task getLocationsWithSuccessBlock:successBlock cacheBlock:cacheBlock failureBlock:failureBlock];
}

@end
