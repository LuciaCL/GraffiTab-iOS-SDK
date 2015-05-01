//
//  GTFeedbackManager.m
//  GraffiTabiOSSDK
//
//  Created by Georgi Christov on 29/04/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTFeedbackManager.h"
#import "GTSendFeedback.h"

@implementation GTFeedbackManager

+ (void)postFeedbackWithText:(NSString *)text successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTSendFeedback *task = [GTSendFeedback new];
    [task postFeedbackWithText:text successBlock:successBlock failureBlock:failureBlock];
}

@end
