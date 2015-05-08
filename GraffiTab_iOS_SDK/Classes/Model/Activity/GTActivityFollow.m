//
//  GTActivityFollow.m
//  GraffiTab_iOS_SDK
//
//  Created by Georgi Christov on 08/05/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTActivityFollow.h"

@implementation GTActivityFollow

- (id)initFromJson:(NSDictionary *)json {
    self = [super initFromJson:json];
    
    if (self) {
        self.followedUser = [[GTPerson alloc] initFromJson:json[JSON_ACTIVITY_FOLLOW_FOLLOWED_USER]];
        self.follower = [[GTPerson alloc] initFromJson:json[JSON_ACTIVITY_FOLLOW_FOLLOWER]];
    }
    
    return self;
}

- (NSDictionary *)asDictionary {
    NSMutableDictionary *json = [NSMutableDictionary dictionaryWithDictionary:[super asDictionary]];
    
    json[JSON_ACTIVITY_FOLLOW_FOLLOWED_USER] = self.followedUser.asDictionary;
    json[JSON_ACTIVITY_FOLLOW_FOLLOWER] = self.follower.asDictionary;
    
    return json;
}

@end
