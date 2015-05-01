//
//  GTCreateUserLocationTask.h
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 11/12/2014.
//  Copyright (c) 2014 GraffiTab. All rights reserved.
//

#import "GTNetworkTask.h"

@interface GTCreateUserLocationTask : GTNetworkTask

- (void)createLocationWithPlacemark:(CLPlacemark *)placemark successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;

@end
