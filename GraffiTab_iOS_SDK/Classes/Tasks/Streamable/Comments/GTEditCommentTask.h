//
//  EditCommentTask.h
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 29/03/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTNetworkTask.h"

@interface GTEditCommentTask : GTNetworkTask

- (void)editCommentWithId:(long)commentId text:(NSString *)text successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;

@end
