//
//  NotificationLike.m
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 04/12/2014.
//  Copyright (c) 2014 GraffiTab. All rights reserved.
//

#import "GTNotificationLike.h"

@implementation GTNotificationLike

- (id)initFromJson:(NSDictionary *)json {
    self = [super initFromJson:json];
    
    if (self) {
        self.item = [GTStreamableFactory createStreamableFromJson:json[JSON_NOTIFICATION_LIKE_ITEM]];
        self.liker = [[GTPerson alloc] initFromJson:json[JSON_NOTIFICATION_LIKE_LIKER]];
    }
    
    return self;
}

- (NSDictionary *)asDictionary {
    NSMutableDictionary *json = [NSMutableDictionary dictionaryWithDictionary:[super asDictionary]];
    
    json[JSON_NOTIFICATION_LIKE_ITEM] = self.item.asDictionary;
    json[JSON_NOTIFICATION_LIKE_LIKER] = self.liker.asDictionary;
    
    return json;
}

@end
