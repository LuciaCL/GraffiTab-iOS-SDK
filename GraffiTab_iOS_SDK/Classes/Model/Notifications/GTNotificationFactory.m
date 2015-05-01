//
//  NotificationFactory.m
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 04/12/2014.
//  Copyright (c) 2014 GraffiTab. All rights reserved.
//

#import "GTNotificationFactory.h"

@implementation GTNotificationFactory

+ (GTNotification *)createNotificationFromJson:(NSDictionary *)json {
    NotificationType type = NotificationType(json[JSON_NOTIFICATION_TYPE]);
    
    if (type == WELCOME)
        return [[GTNotificationWelcome alloc] initFromJson:json];
    else if (type == MENTION)
        return [[GTNotificationMention alloc] initFromJson:json];
    else if (type == LIKE)
        return [[GTNotificationLike alloc] initFromJson:json];
    else if (type == FOLLOW)
        return [[GTNotificationFollow alloc] initFromJson:json];
    else if (type == COMMENT)
        return [[GTNotificationComment alloc] initFromJson:json];
    else
        return [[GTNotification alloc] initFromJson:json];
}

@end
