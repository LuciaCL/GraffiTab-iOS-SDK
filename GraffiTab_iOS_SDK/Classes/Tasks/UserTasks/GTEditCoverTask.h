//
//  EditCoverTask.h
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 15/04/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTNetworkTask.h"

@interface GTEditCoverTask : GTNetworkTask

- (void)editCoverWithNewImage:(UIImage *)image successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;

@end
