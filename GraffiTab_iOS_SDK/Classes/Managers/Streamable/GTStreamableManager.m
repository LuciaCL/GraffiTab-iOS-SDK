//
//  GTStreamableManager.m
//  GraffiTabiOSSDK
//
//  Created by Georgi Christov on 29/04/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTStreamableManager.h"
#import "GTGetNewestItemsTask.h"
#import "GTGetPopularItemsTask.h"
#import "GTGetUserFavouritesTask.h"
#import "GTGetUserHomeStreamTask.h"
#import "GTGetUserItemsTask.h"
#import "GTDeleteCommentsTask.h"
#import "GTEditCommentTask.h"
#import "GTGetCommentsTask.h"
#import "GTPostCommentTask.h"
#import "GTGetLikersTask.h"
#import "GTLikeItemTask.h"
#import "GTUnlikeItemTask.h"
#import "GTCreateStreamableTagTask.h"
#import "GTGetStreamablesForLocationTask.h"
#import "GTFlagTask.h"
#import "GTMakePrivateTask.h"
#import "GTMakePublicTask.h"
#import "GTDeleteItemTask.h"
#import "GTEditStreamableTagTask.h"
#import "GTGetPrivateItems.h"

@implementation GTStreamableManager

+ (void)getNewestItemsWithStart:(int)start numberOfItems:(int)count useCache:(BOOL)useCache successBlock:(void (^)(GTResponseObject *))successBlock cacheBlock:(void (^)(GTResponseObject *))cacheBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTGetNewestItemsTask *task = [GTGetNewestItemsTask new];
    task.isStart = useCache;
    [task getNewestItemsWithStart:start numberOfItems:count successBlock:successBlock cacheBlock:cacheBlock failureBlock:failureBlock];
}

+ (void)getPopularItemsWithStart:(int)start numberOfItems:(int)count useCache:(BOOL)useCache successBlock:(void (^)(GTResponseObject *))successBlock cacheBlock:(void (^)(GTResponseObject *))cacheBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTGetPopularItemsTask *task = [GTGetPopularItemsTask new];
    task.isStart = useCache;
    [task getPopularItemsWithStart:start numberOfItems:count successBlock:successBlock cacheBlock:cacheBlock failureBlock:failureBlock];
}

+ (void)getFavouriteItemsWithUserId:(long)userId start:(int)start numberOfItems:(int)count useCache:(BOOL)useCache successBlock:(void (^)(GTResponseObject *))successBlock cacheBlock:(void (^)(GTResponseObject *))cacheBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTGetUserFavouritesTask *task = [GTGetUserFavouritesTask new];
    task.isStart = useCache;
    [task getFavouriteItemsWithUserId:userId start:start numberOfItems:count successBlock:successBlock cacheBlock:cacheBlock failureBlock:failureBlock];
}

+ (void)getUserHomeStreamWithStart:(int)start numberOfItems:(int)count useCache:(BOOL)useCache successBlock:(void (^)(GTResponseObject *))successBlock cacheBlock:(void (^)(GTResponseObject *))cacheBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTGetUserHomeStreamTask *task = [GTGetUserHomeStreamTask new];
    task.isStart = useCache;
    [task getUserHomeStreamWithStart:start numberOfItems:count successBlock:successBlock cacheBlock:cacheBlock failureBlock:failureBlock];
}

+ (void)getItemsWithUserId:(long)userId start:(int)start numberOfItems:(int)count useCache:(BOOL)useCache successBlock:(void (^)(GTResponseObject *))successBlock cacheBlock:(void (^)(GTResponseObject *))cacheBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTGetUserItemsTask *task = [GTGetUserItemsTask new];
    task.isStart = useCache;
    [task getItemsWithUserId:userId start:start numberOfItems:count successBlock:successBlock cacheBlock:cacheBlock failureBlock:failureBlock];
}

+ (void)flagItemWithId:(long)itemId successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTFlagTask *task = [GTFlagTask new];
    [task flagItemWithId:itemId successBlock:successBlock failureBlock:failureBlock];
}

+ (void)makeItemPublicWithId:(long)itemId successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTMakePublicTask *task = [GTMakePublicTask new];
    [task makeItemPublicWithId:itemId successBlock:successBlock failureBlock:failureBlock];
}

+ (void)makeItemPrivateWithId:(long)itemId successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTMakePrivateTask *task = [GTMakePrivateTask new];
    [task makeItemPrivateWithId:itemId successBlock:successBlock failureBlock:failureBlock];
}

+ (void)deleteItemsWithIds:(NSMutableArray *)ids successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTDeleteItemTask *task = [GTDeleteItemTask new];
    [task deleteItemsWithIds:ids successBlock:successBlock failureBlock:failureBlock];
}

+ (void)getPrivateItemsWithStart:(int)start numberOfItems:(int)count useCache:(BOOL)useCache successBlock:(void (^)(GTResponseObject *))successBlock cacheBlock:(void (^)(GTResponseObject *))cacheBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTGetPrivateItems *task = [GTGetPrivateItems new];
    task.isStart = useCache;
    [task getPrivateItemsWithStart:start numberOfItems:count successBlock:successBlock cacheBlock:cacheBlock failureBlock:failureBlock];
}

#pragma mark - Comments

+ (void)deleteComments:(NSMutableArray *)ids successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTDeleteCommentsTask *task = [GTDeleteCommentsTask new];
    [task deleteComments:ids successBlock:successBlock failureBlock:failureBlock];
}

+ (void)editCommentWithId:(long)commentId text:(NSString *)text successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTEditCommentTask *task = [GTEditCommentTask new];
    [task editCommentWithId:commentId text:text successBlock:successBlock failureBlock:failureBlock];
}

+ (void)getCommentsWithItemId:(long)itemId start:(int)start numberOfItems:(int)count useCache:(BOOL)useCache successBlock:(void (^)(GTResponseObject *))successBlock cacheBlock:(void (^)(GTResponseObject *))cacheBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTGetCommentsTask *task = [GTGetCommentsTask new];
    task.isStart = useCache;
    [task getCommentsWithItemId:itemId start:start numberOfItems:count successBlock:successBlock cacheBlock:cacheBlock failureBlock:failureBlock];
}

+ (void)postCommentWithText:(NSString *)text itemId:(long)itemId successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTPostCommentTask *task = [GTPostCommentTask new];
    [task postCommentWithText:text itemId:itemId successBlock:successBlock failureBlock:failureBlock];
}

#pragma mark - Likes

+ (void)getLikersWithItemId:(long)itemId start:(int)start numberOfItems:(int)count useCache:(BOOL)useCache successBlock:(void (^)(GTResponseObject *))successBlock cacheBlock:(void (^)(GTResponseObject *))cacheBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTGetLikersTask *task = [GTGetLikersTask new];
    task.isStart = useCache;
    [task getLikersWithItemId:itemId start:start numberOfItems:count successBlock:successBlock cacheBlock:cacheBlock failureBlock:failureBlock];
}

+ (void)likeItemWithId:(long)itemId successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTLikeItemTask *task = [GTLikeItemTask new];
    [task likeItemWithId:itemId successBlock:successBlock failureBlock:failureBlock];
}

+ (void)unlikeItemWithId:(long)itemId successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTUnlikeItemTask *task = [GTUnlikeItemTask new];
    [task unlikeItemWithId:itemId successBlock:successBlock failureBlock:failureBlock];
}

#pragma mark - Tags

+ (void)createTagWithImage:(UIImage *)image location:(CLLocation *)location successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTCreateStreamableTagTask *task = [GTCreateStreamableTagTask new];
    [task createTagWithImage:image location:location successBlock:successBlock failureBlock:failureBlock];
}

+ (void)editTagWithId:(long)itemId image:(UIImage *)image location:(CLLocation *)location successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTEditStreamableTagTask *task = [GTEditStreamableTagTask new];
    [task editTagWithId:itemId image:image location:location successBlock:successBlock failureBlock:failureBlock];
}

+ (void)getForLocationWithNECoordinate:(CLLocationCoordinate2D)neCoordinate SWCoordinate:(CLLocationCoordinate2D)swCoordinate start:(int)start numberOfItems:(int)count useCache:(BOOL)useCache successBlock:(void (^)(GTResponseObject *))successBlock cacheBlock:(void (^)(GTResponseObject *))cacheBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTGetStreamablesForLocationTask *task = [GTGetStreamablesForLocationTask new];
    task.isStart = useCache;
    [task getForLocationWithNECoordinate:neCoordinate SWCoordinate:swCoordinate start:start numberOfItems:count successBlock:successBlock cacheBlock:cacheBlock failureBlock:failureBlock];
}

@end
