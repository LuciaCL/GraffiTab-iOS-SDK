//
//  SearchHashtag.h
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 14/04/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTNetworkTask.h"

@interface GTSearchHashtag : GTNetworkTask

- (void)searchHashtagWithQuery:(NSString *)q offset:(int)start numberOfItems:(int)count successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;

@end
