//
//  VerifyExternalUserTask.h
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 27/11/2014.
//  Copyright (c) 2014 GraffiTab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GTNetworkTask.h"

@interface GTVerifyExternalUserTask : GTNetworkTask

- (void)verifyUserWithExternalId:(NSString *)externalId successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;

@end
