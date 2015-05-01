//
//  GTLeaveConversationTask.h
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 10/04/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTNetworkTask.h"

@interface GTLeaveConversationTask : GTNetworkTask

- (void)leaveConversation:(long)conversationId successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;

@end
