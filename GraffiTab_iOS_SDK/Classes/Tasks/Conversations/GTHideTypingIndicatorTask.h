//
//  GTHideTypingIndicatorTask.h
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 07/04/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTNetworkTask.h"

@interface GTHideTypingIndicatorTask : GTNetworkTask

- (void)hideTypingIndicatorForConversationId:(long)conversationId successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;

@end
