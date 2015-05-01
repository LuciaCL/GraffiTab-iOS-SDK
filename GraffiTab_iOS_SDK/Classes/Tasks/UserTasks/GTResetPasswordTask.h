//
//  ResetPasswordTask.h
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 25/11/2014.
//  Copyright (c) 2014 GraffiTab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GTNetworkTask.h"

@interface GTResetPasswordTask : GTNetworkTask

- (void)resetPasswordWithEmail:(NSString *)email successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;

@end
