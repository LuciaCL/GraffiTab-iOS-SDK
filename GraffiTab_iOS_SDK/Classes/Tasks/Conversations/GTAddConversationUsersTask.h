//
//  GTAddConversationUsersTask.h
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 13/04/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTNetworkTask.h"

@interface GTAddConversationUsersTask : GTNetworkTask

- (void)addConversationUsersWithConversationId:(long)conversationId receiverIds:(NSMutableArray *)receiverIds successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;

@end
