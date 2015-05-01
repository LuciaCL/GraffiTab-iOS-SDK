//
//  GTEditConversationImageTask.h
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 14/04/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTNetworkTask.h"

@interface GTEditConversationImageTask : GTNetworkTask

- (void)editConversationImageWithConversationId:(long)conversationId image:(UIImage *)image successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;

@end
