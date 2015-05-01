//
//  GTSendFeedback.h
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 26/04/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTNetworkTask.h"

@interface GTSendFeedback : GTNetworkTask

- (void)postFeedbackWithText:(NSString *)text successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;

@end
