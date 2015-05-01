//
//  GTEditMessageTask.h
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 04/04/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTNetworkTask.h"

@interface GTEditMessageTask : GTNetworkTask

- (void)editMessageWithId:(long)messageId text:(NSString *)text successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;

@end
