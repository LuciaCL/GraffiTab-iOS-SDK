//
//  GTSearchManager.m
//  GraffiTabiOSSDK
//
//  Created by Georgi Christov on 29/04/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTSearchManager.h"
#import "GTSearchHashtag.h"
#import "GTSearchHashtags.h"
#import "GTSearchUsers.h"

@implementation GTSearchManager

+ (void)searchHashtagWithQuery:(NSString *)q offset:(int)start numberOfItems:(int)count successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTSearchHashtag *task = [GTSearchHashtag new];
    [task searchHashtagWithQuery:q offset:start numberOfItems:count successBlock:successBlock failureBlock:failureBlock];
}

+ (void)searchHashtagsWithQuery:(NSString *)q offset:(int)start numberOfItems:(int)count successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTSearchHashtags *task = [GTSearchHashtags new];
    [task searchHashtagsWithQuery:q offset:start numberOfItems:count successBlock:successBlock failureBlock:failureBlock];
}

+ (void)searchUsersWithQuery:(NSString *)q offset:(int)start numberOfItems:(int)count successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTSearchUsers *task = [GTSearchUsers new];
    [task searchUsersWithQuery:q offset:start numberOfItems:count successBlock:successBlock failureBlock:failureBlock];
}

@end
