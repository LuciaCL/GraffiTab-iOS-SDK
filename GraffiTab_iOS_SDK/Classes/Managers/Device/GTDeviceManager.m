//
//  GTDeviceManager.m
//  GraffiTabiOSSDK
//
//  Created by Georgi Christov on 29/04/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTDeviceManager.h"
#import "GTRegisterDeviceTask.h"
#import "GTUnregisterDeviceTask.h"

@implementation GTDeviceManager

+ (void)registerDeviceWithToken:(NSString *)token successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTRegisterDeviceTask *task = [GTRegisterDeviceTask new];
    [task registerDeviceWithToken:token successBlock:successBlock failureBlock:failureBlock];
}

+ (void)unregisterDeviceWithToken:(NSString *)token successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTUnregisterDeviceTask *task = [GTUnregisterDeviceTask new];
    [task unregisterDeviceWithToken:token successBlock:successBlock failureBlock:failureBlock];
}

@end
