//
//  LikeItemTask.h
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 05/12/2014.
//  Copyright (c) 2014 GraffiTab. All rights reserved.
//

#import "GTNetworkTask.h"

@interface GTLikeItemTask : GTNetworkTask

- (void)likeItemWithId:(long)itemId successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;

@end
