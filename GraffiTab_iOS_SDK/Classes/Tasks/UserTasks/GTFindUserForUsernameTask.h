//
//  FindUserForUsernameTask.h
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 20/04/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTNetworkTask.h"

@interface GTFindUserForUsernameTask : GTNetworkTask

- (void)findUserForUsername:(NSString *)username successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;

@end
