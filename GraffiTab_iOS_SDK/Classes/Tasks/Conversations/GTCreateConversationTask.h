//
//  GTCreateConversationTask.h
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 10/04/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTNetworkTask.h"

@interface GTCreateConversationTask : GTNetworkTask

- (void)createConversationWithText:(NSString *)msg title:(NSString *)title receiverIds:(NSMutableArray *)receiverIds image:(UIImage *)image successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;

@end
