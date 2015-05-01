//
//  GTUserManager.h
//  GraffiTabiOSSDK
//
//  Created by Georgi Christov on 29/04/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GTUserManager : NSObject

+ (void)findUserForUsername:(NSString *)username successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;
+ (void)getMostActiveUsersWithStart:(int)start numberOfItems:(int)count useCache:(BOOL)useCache successBlock:(void (^)(GTResponseObject *))successBlock cacheBlock:(void (^)(GTResponseObject *))cacheBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;
+ (void)getFriendsListWithIds:(NSArray *)ids start:(int)start numberOfItems:(int)count useCache:(BOOL)useCache successBlock:(void (^)(GTResponseObject *))successBlock cacheBlock:(void (^)(GTResponseObject *))cacheBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;
+ (void)getUserProfileWithId:(long)userId successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;

#pragma mark - Login

+ (void)checkLoginStatusWithSuccessBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;
+ (void)linkExternalId:(NSString *)externalId successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;
+ (void)loginWithUsername:(NSString *)username password:(NSString *)password successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;
+ (void)logoutWithSuccessBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;
+ (void)resetPasswordWithEmail:(NSString *)email successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;
+ (void)signupWithUsername:(NSString *)username password:(NSString *)password email:(NSString *)email firstName:(NSString *)firstName lastName:(NSString *)lastName externalId:(NSString *)externalId successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;
+ (void)verifyUserWithExternalId:(NSString *)externalId successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;

#pragma mark - Edit

+ (void)editAvatarWithNewImage:(UIImage *)image successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;
+ (void)editCoverWithNewImage:(UIImage *)image successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;
+ (void)editProfileWithPassword:(NSString *)password newPassword:(NSString *)newPassword successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;
+ (void)editProfileWithFirstName:(NSString *)firstName lastName:(NSString *)lastName email:(NSString *)email about:(NSString *)about website:(NSString *)website successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;

#pragma mark - Followers

+ (void)unfollowUserWithId:(long)userId successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;
+ (void)followUserWithId:(long)userId successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;
+ (void)getFollowersWithUserId:(long)userId start:(int)start numberOfItems:(int)count useCache:(BOOL)useCache successBlock:(void (^)(GTResponseObject *))successBlock cacheBlock:(void (^)(GTResponseObject *))cacheBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;
+ (void)getFollowingWithUserId:(long)userId start:(int)start numberOfItems:(int)count useCache:(BOOL)useCache successBlock:(void (^)(GTResponseObject *))successBlock cacheBlock:(void (^)(GTResponseObject *))cacheBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;

@end
