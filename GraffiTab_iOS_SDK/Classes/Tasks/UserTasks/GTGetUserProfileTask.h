//
//  GetUserProfileTask.h
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 16/04/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTNetworkTask.h"

@interface GTGetUserProfileTask : GTNetworkTask

- (void)getUserProfileWithId:(long)userId successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;

@end
