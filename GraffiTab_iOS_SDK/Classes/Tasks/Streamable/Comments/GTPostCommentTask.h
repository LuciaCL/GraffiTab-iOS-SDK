//
//  PostCommentTask.h
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 28/03/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTNetworkTask.h"

@interface GTPostCommentTask : GTNetworkTask

- (void)postCommentWithText:(NSString *)text itemId:(long)itemId successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;

@end
