//
//  GetSocialFriends.h
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 27/11/2014.
//  Copyright (c) 2014 GraffiTab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GTNetworkTask.h"

@interface GTGetSocialFriends : GTNetworkTask

@property (nonatomic, assign) BOOL isStart;

- (void)getFriendsListWithIds:(NSArray *)ids start:(int)start numberOfItems:(int)count successBlock:(void (^)(GTResponseObject *))successBlock cacheBlock:(void (^)(GTResponseObject *))cacheBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;

@end
