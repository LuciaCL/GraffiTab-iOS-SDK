//
//  GetCommentsTask.h
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 28/03/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTNetworkTask.h"

@interface GTGetCommentsTask : GTNetworkTask

@property (nonatomic, assign) BOOL isStart;

- (void)getCommentsWithItemId:(long)itemId start:(int)start numberOfItems:(int)count successBlock:(void (^)(GTResponseObject *))successBlock cacheBlock:(void (^)(GTResponseObject *))cacheBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;

@end
