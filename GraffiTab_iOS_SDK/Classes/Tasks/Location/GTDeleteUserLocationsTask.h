//
//  GTDeleteUserLocationsTask.h
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 11/12/2014.
//  Copyright (c) 2014 GraffiTab. All rights reserved.
//

#import "GTNetworkTask.h"

@interface GTDeleteUserLocationsTask : GTNetworkTask

- (void)deleteLocations:(NSMutableArray *)locationIds successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;

@end
