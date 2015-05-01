//
//  GTSearchManager.h
//  GraffiTabiOSSDK
//
//  Created by Georgi Christov on 29/04/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GTSearchManager : NSObject

+ (void)searchHashtagWithQuery:(NSString *)q offset:(int)start numberOfItems:(int)count successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;
+ (void)searchHashtagsWithQuery:(NSString *)q offset:(int)start numberOfItems:(int)count successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;
+ (void)searchUsersWithQuery:(NSString *)q offset:(int)start numberOfItems:(int)count successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;

@end
