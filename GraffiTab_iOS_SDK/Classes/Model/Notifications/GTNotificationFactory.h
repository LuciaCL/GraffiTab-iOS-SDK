//
//  NotificationFactory.h
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 04/12/2014.
//  Copyright (c) 2014 GraffiTab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GTNotificationFactory : NSObject

+ (GTNotification *)createNotificationFromJson:(NSDictionary *)json;

@end
