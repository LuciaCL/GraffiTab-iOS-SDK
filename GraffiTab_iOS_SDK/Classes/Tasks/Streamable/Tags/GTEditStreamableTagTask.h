//
//  GTEditStreamableTagTask.h
//  GraffiTab_iOS_SDK
//
//  Created by Georgi Christov on 02/05/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTNetworkTask.h"

@interface GTEditStreamableTagTask : GTNetworkTask

- (void)editTagWithId:(long)itemId image:(UIImage *)image location:(CLLocation *)location successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;

@end
