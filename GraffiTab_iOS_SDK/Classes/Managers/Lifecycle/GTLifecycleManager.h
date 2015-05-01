//
//  GTLifecycleManager.h
//  GraffiTabiOSSDK
//
//  Created by Georgi Christov on 30/04/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GTLifecycleManager : NSObject

#pragma mark - User settings

+ (GTPerson *)user;
+ (void)setUser:(GTPerson *)user;
+ (BOOL)isLoggedIn;

#pragma mark - Device token settings

+ (NSString *)token;
+ (void)setToken:(NSString *)token;

#pragma mark - App lifecycle

+ (void)applicationWillResignActive;
+ (void)applicationDidBecomeActive;

@end
