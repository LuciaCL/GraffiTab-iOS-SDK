//
//  EditProfileTask.h
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 17/04/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTNetworkTask.h"

@interface GTEditProfileTask : GTNetworkTask

- (void)editProfileWithFirstName:(NSString *)firstName lastName:(NSString *)lastName email:(NSString *)email about:(NSString *)about website:(NSString *)website successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;

@end
