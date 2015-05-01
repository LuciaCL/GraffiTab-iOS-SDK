//
//  SearchHashtags.h
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 03/04/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTNetworkTask.h"

@interface GTSearchHashtags : GTNetworkTask

- (void)searchHashtagsWithQuery:(NSString *)q offset:(int)start numberOfItems:(int)count successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;

@end
