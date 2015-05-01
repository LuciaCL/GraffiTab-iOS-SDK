//
//  DeleteCommentsTask.h
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 28/03/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTNetworkTask.h"

@interface GTDeleteCommentsTask : GTNetworkTask

- (void)deleteComments:(NSMutableArray *)ids successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;

@end
