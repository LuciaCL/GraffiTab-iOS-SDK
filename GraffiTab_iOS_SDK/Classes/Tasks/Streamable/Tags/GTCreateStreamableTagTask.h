//
//  CreateStreamableTagTask.h
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 05/12/2014.
//  Copyright (c) 2014 GraffiTab. All rights reserved.
//

#import "GTNetworkTask.h"

@interface GTCreateStreamableTagTask : GTNetworkTask

- (void)createTagWithImage:(UIImage *)image location:(CLLocation *)location successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;

@end
