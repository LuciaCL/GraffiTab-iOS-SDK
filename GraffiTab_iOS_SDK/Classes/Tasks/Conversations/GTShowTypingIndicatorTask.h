//
//  GTShowTypingIndicatorTask.h
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 07/04/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTNetworkTask.h"

@interface GTShowTypingIndicatorTask : GTNetworkTask

- (void)showTypingIndicatorForConversationId:(long)conversationId successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;

@end
