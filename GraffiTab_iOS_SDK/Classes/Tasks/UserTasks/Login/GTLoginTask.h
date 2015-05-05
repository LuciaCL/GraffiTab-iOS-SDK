//
//  LoginTask.h
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 26/11/2014.
//  Copyright (c) 2014 GraffiTab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GTNetworkTask.h"

@interface GTLoginTask : GTNetworkTask

- (void)loginWithUsername:(NSString *)username password:(NSString *)password successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;

@end
