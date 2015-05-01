//
//  Settings.m
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 26/11/2014.
//  Copyright (c) 2014 GraffiTab. All rights reserved.
//

#import "GTSettings.h"

@implementation GTSettings

static GTSettings *sharedInstance = nil;

+ (GTSettings *)getInstance {
    if (!sharedInstance)
        sharedInstance = [GTSettings new];
    
    return sharedInstance;
}

- (id)init {
    self = [super init];
    
    if (self) {
        [self baseInit];
    }
    
    return self;
}

- (void)baseInit {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if ([defaults objectForKey:KEY_LOGGED_IN_USER])
        self.user = [[GTPerson alloc] initFromJson:[defaults objectForKey:KEY_LOGGED_IN_USER]];
}

- (BOOL)isLoggedIn {
    return self.user != nil;
}

- (void)setUser:(GTPerson *)p {
    _user = p;
    
    if (p) {
        [[NSUserDefaults standardUserDefaults] setObject:p.asDictionary forKey:KEY_LOGGED_IN_USER];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    else {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:KEY_LOGGED_IN_USER];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

- (NSString *)token {
    return [[NSUserDefaults standardUserDefaults] stringForKey:KEY_TOKEN];
}

- (void)setToken:(NSString *)token {
    [[NSUserDefaults standardUserDefaults] setValue:token forKey:KEY_TOKEN];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
