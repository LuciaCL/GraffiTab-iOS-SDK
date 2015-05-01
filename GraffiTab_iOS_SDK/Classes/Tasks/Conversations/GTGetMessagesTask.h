//
//  GTGetMessagesTask.h
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 10/12/2014.
//  Copyright (c) 2014 GraffiTab. All rights reserved.
//

#import "GTNetworkTask.h"

@interface GTGetMessagesTask : GTNetworkTask

@property (nonatomic, assign) BOOL isStart;

- (void)getMessagesWithConversationId:(long)conversationId start:(int)start numberOfItems:(int)count successBlock:(void (^)(GTResponseObject *))successBlock cacheBlock:(void (^)(GTResponseObject *))cacheBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;

@end
