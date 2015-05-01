//
//  CheckLoginStatus.h
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 27/11/2014.
//  Copyright (c) 2014 GraffiTab. All rights reserved.
//

#import "GTNetworkTask.h"

@interface GTCheckLoginStatus : GTNetworkTask

- (void)checkLoginStatusWithSuccessBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;

@end
