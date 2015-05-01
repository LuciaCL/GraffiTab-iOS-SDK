//
//  Settings.h
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 26/11/2014.
//  Copyright (c) 2014 GraffiTab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GTPerson.h"

@interface GTSettings : NSObject

@property (nonatomic, strong) GTPerson *user;

+ (GTSettings *)getInstance;

- (BOOL)isLoggedIn;

- (NSString *)token;
- (void)setToken:(NSString *)token;

@end
