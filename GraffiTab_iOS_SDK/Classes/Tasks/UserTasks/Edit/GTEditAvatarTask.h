//
//  EditAvatarTask.h
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 27/11/2014.
//  Copyright (c) 2014 GraffiTab. All rights reserved.
//

#import "GTNetworkTask.h"

@interface GTEditAvatarTask : GTNetworkTask

- (void)editAvatarWithNewImage:(UIImage *)image successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;

@end
