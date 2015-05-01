//
//  EditPasswordTask.h
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 18/04/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTNetworkTask.h"

@interface GTEditPasswordTask : GTNetworkTask

- (void)editProfileWithPassword:(NSString *)password newPassword:(NSString *)newPassword successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;

@end
