//
//  GetStreamablesForLocationTask.h
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 19/04/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTNetworkTask.h"

@interface GTGetStreamablesForLocationTask : GTNetworkTask

- (void)getForLocationWithNECoordinate:(CLLocationCoordinate2D)neCoordinate SWCoordinate:(CLLocationCoordinate2D)swCoordinate start:(int)start numberOfItems:(int)count successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;

@end
