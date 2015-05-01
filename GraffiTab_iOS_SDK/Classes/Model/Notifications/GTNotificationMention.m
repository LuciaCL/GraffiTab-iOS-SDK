//
//  NotificationMention.m
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 04/12/2014.
//  Copyright (c) 2014 GraffiTab. All rights reserved.
//

#import "GTNotificationMention.h"

@implementation GTNotificationMention

- (id)initFromJson:(NSDictionary *)json {
    self = [super initFromJson:json];
    
    if (self) {
        self.item = [GTStreamableFactory createStreamableFromJson:json[JSON_NOTIFICATION_MENTION_ITEM]];
        self.mentioner = [[GTPerson alloc] initFromJson:json[JSON_NOTIFICATION_MENTION_MENTIONER]];
    }
    
    return self;
}

- (NSDictionary *)asDictionary {
    NSMutableDictionary *json = [NSMutableDictionary dictionaryWithDictionary:[super asDictionary]];
    
    json[JSON_NOTIFICATION_MENTION_ITEM] = self.item.asDictionary;
    json[JSON_NOTIFICATION_MENTION_MENTIONER] = self.mentioner.asDictionary;
    
    return json;
}

@end
