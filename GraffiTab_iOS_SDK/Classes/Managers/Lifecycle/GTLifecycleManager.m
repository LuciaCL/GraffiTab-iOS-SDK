//
//  GTLifecycleManager.m
//  GraffiTabiOSSDK
//
//  Created by Georgi Christov on 30/04/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTLifecycleManager.h"

@implementation GTLifecycleManager

#pragma mark - User settings

+ (GTPerson *)user {
    return [GTSettings getInstance].user;
}

+ (void)setUser:(GTPerson *)user {
    [GTSettings getInstance].user = user;
}

+ (BOOL)isLoggedIn {
    return [GTSettings getInstance].isLoggedIn;
}

#pragma mark - Device token settings

+ (NSString *)token {
    return [GTSettings getInstance].token;
}

+ (void)setToken:(NSString *)token {
    return [[GTSettings getInstance] setToken:token];
}

#pragma mark - App lifecycle

+ (void)applicationWillResignActive {
    [GTCookieManager saveCookies];
}

+ (void)applicationDidBecomeActive {
    [GTCookieManager loadCookies];
}

@end
