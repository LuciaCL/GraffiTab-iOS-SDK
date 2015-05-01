//
//  NotificationFollow.m
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 04/12/2014.
//  Copyright (c) 2014 GraffiTab. All rights reserved.
//

#import "GTNotificationFollow.h"

@implementation GTNotificationFollow

- (id)initFromJson:(NSDictionary *)json {
    self = [super initFromJson:json];
    
    if (self) {
        self.follower = [[GTPerson alloc] initFromJson:json[JSON_NOTIFICATION_FOLLOW_FOLLOWER]];
    }
    
    return self;
}

- (NSDictionary *)asDictionary {
    NSMutableDictionary *json = [NSMutableDictionary dictionaryWithDictionary:[super asDictionary]];
    
    json[JSON_NOTIFICATION_FOLLOW_FOLLOWER] = self.follower.asDictionary;
    
    return json;
}

@end
