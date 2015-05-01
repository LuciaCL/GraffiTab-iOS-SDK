//
//  SignUpTask.h
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 26/11/2014.
//  Copyright (c) 2014 GraffiTab. All rights reserved.
//

#import "GTNetworkTask.h"

@interface GTSignUpTask : GTNetworkTask

- (void)signupWithUsername:(NSString *)username password:(NSString *)password email:(NSString *)email firstName:(NSString *)firstName lastName:(NSString *)lastName externalId:(NSString *)externalId successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;

@end
