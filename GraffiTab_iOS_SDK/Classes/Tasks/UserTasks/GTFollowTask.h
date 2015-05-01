//
//  FollowTask.h
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 03/12/2014.
//  Copyright (c) 2014 GraffiTab. All rights reserved.
//

#import "GTNetworkTask.h"

@interface GTFollowTask : GTNetworkTask

- (void)followUserWithId:(long)userId successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;

@end
