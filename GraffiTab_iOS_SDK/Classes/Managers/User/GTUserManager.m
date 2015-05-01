//
//  GTUserManager.m
//  GraffiTabiOSSDK
//
//  Created by Georgi Christov on 29/04/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTUserManager.h"
#import "GTFindUserForUsernameTask.h"
#import "GTGetMostActiveUsersTask.h"
#import "GTGetSocialFriends.h"
#import "GTGetUserProfileTask.h"
#import "GTCheckLoginStatus.h"
#import "GTLinkExternalIdTask.h"
#import "GTLoginTask.h"
#import "GTLogoutTask.h"
#import "GTResetPasswordTask.h"
#import "GTSignUpTask.h"
#import "GTVerifyExternalUserTask.h"
#import "GTEditAvatarTask.h"
#import "GTEditCoverTask.h"
#import "GTEditPasswordTask.h"
#import "GTEditProfileTask.h"
#import "GTUnfollowTask.h"
#import "GTFollowTask.h"
#import "GTGetFollowersTask.h"
#import "GTGetFollowingTask.h"

@implementation GTUserManager

+ (void)findUserForUsername:(NSString *)username successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTFindUserForUsernameTask *task = [GTFindUserForUsernameTask new];
    [task findUserForUsername:username successBlock:successBlock failureBlock:failureBlock];
}

+ (void)getMostActiveUsersWithStart:(int)start numberOfItems:(int)count useCache:(BOOL)useCache successBlock:(void (^)(GTResponseObject *))successBlock cacheBlock:(void (^)(GTResponseObject *))cacheBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTGetMostActiveUsersTask *task = [GTGetMostActiveUsersTask new];
    task.isStart = useCache;
    [task getMostActiveUsersWithStart:start numberOfItems:count successBlock:successBlock cacheBlock:cacheBlock failureBlock:failureBlock];
}

+ (void)getFriendsListWithIds:(NSArray *)ids start:(int)start numberOfItems:(int)count useCache:(BOOL)useCache successBlock:(void (^)(GTResponseObject *))successBlock cacheBlock:(void (^)(GTResponseObject *))cacheBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTGetSocialFriends *task = [GTGetSocialFriends new];
    task.isStart = useCache;
    [task getFriendsListWithIds:ids start:start numberOfItems:count successBlock:successBlock cacheBlock:cacheBlock failureBlock:failureBlock];
}

+ (void)getUserProfileWithId:(long)userId successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTGetUserProfileTask *task = [GTGetUserProfileTask new];
    [task getUserProfileWithId:userId successBlock:successBlock failureBlock:failureBlock];
}

#pragma mark - Login

+ (void)checkLoginStatusWithSuccessBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTCheckLoginStatus *task = [GTCheckLoginStatus new];
    [task checkLoginStatusWithSuccessBlock:successBlock failureBlock:failureBlock];
}

+ (void)linkExternalId:(NSString *)externalId successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTLinkExternalIdTask *task = [GTLinkExternalIdTask new];
    [task linkExternalId:externalId successBlock:successBlock failureBlock:failureBlock];
}

+ (void)loginWithUsername:(NSString *)username password:(NSString *)password successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTLoginTask *task = [GTLoginTask new];
    [task loginWithUsername:username password:password successBlock:successBlock failureBlock:failureBlock];
}

+ (void)logoutWithSuccessBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTLogoutTask *task = [GTLogoutTask new];
    [task logoutWithSuccessBlock:successBlock failureBlock:failureBlock];
}

+ (void)resetPasswordWithEmail:(NSString *)email successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTResetPasswordTask *task = [GTResetPasswordTask new];
    [task resetPasswordWithEmail:email successBlock:successBlock failureBlock:failureBlock];
}

+ (void)signupWithUsername:(NSString *)username password:(NSString *)password email:(NSString *)email firstName:(NSString *)firstName lastName:(NSString *)lastName externalId:(NSString *)externalId successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTSignUpTask *task = [GTSignUpTask new];
    [task signupWithUsername:username password:password email:email firstName:firstName lastName:lastName externalId:externalId successBlock:successBlock failureBlock:failureBlock];
}

+ (void)verifyUserWithExternalId:(NSString *)externalId successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTVerifyExternalUserTask *task = [GTVerifyExternalUserTask new];
    [task verifyUserWithExternalId:externalId successBlock:successBlock failureBlock:failureBlock];
}

#pragma mark - Edit

+ (void)editAvatarWithNewImage:(UIImage *)image successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTEditAvatarTask *task = [GTEditAvatarTask new];
    [task editAvatarWithNewImage:image successBlock:successBlock failureBlock:failureBlock];
}

+ (void)editCoverWithNewImage:(UIImage *)image successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTEditCoverTask *task = [GTEditCoverTask new];
    [task editCoverWithNewImage:image successBlock:successBlock failureBlock:failureBlock];
}

+ (void)editProfileWithPassword:(NSString *)password newPassword:(NSString *)newPassword successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTEditPasswordTask *task = [GTEditPasswordTask new];
    [task editProfileWithPassword:password newPassword:newPassword successBlock:successBlock failureBlock:failureBlock];
}

+ (void)editProfileWithFirstName:(NSString *)firstName lastName:(NSString *)lastName email:(NSString *)email about:(NSString *)about website:(NSString *)website successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTEditProfileTask *task = [GTEditProfileTask new];
    [task editProfileWithFirstName:firstName lastName:lastName email:email about:about website:website successBlock:successBlock failureBlock:failureBlock];
}

#pragma mark - Followers

+ (void)unfollowUserWithId:(long)userId successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTUnfollowTask *task = [GTUnfollowTask new];
    [task unfollowUserWithId:userId successBlock:successBlock failureBlock:failureBlock];
}

+ (void)followUserWithId:(long)userId successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTFollowTask *task = [GTFollowTask new];
    [task followUserWithId:userId successBlock:successBlock failureBlock:failureBlock];
}

+ (void)getFollowersWithUserId:(long)userId start:(int)start numberOfItems:(int)count useCache:(BOOL)useCache successBlock:(void (^)(GTResponseObject *))successBlock cacheBlock:(void (^)(GTResponseObject *))cacheBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTGetFollowersTask *task = [GTGetFollowersTask new];
    task.isStart = useCache;
    [task getFollowersWithUserId:userId start:start numberOfItems:count successBlock:successBlock cacheBlock:cacheBlock failureBlock:failureBlock];
}

+ (void)getFollowingWithUserId:(long)userId start:(int)start numberOfItems:(int)count useCache:(BOOL)useCache successBlock:(void (^)(GTResponseObject *))successBlock cacheBlock:(void (^)(GTResponseObject *))cacheBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTGetFollowingTask *task = [GTGetFollowingTask new];
    task.isStart = useCache;
    [task getFollowingWithUserId:userId start:start numberOfItems:count successBlock:successBlock cacheBlock:cacheBlock failureBlock:failureBlock];
}

@end
