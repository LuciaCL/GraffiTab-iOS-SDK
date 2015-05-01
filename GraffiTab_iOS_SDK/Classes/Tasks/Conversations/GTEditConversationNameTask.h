//
//  GTEditConversationNameTask.h
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 13/04/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTNetworkTask.h"

@interface GTEditConversationNameTask : GTNetworkTask

- (void)editConversationTitleWithId:(long)conversationId text:(NSString *)text successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;

@end
