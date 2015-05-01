//
//  NotificationComment.h
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 04/12/2014.
//  Copyright (c) 2014 GraffiTab. All rights reserved.
//

#import "GTNotification.h"

@interface GTNotificationComment : GTNotification

@property (nonatomic, strong) GTPerson *commenter;
@property (nonatomic, strong) GTStreamable *item;
@property (nonatomic, strong) GTComment *comment;

@end
