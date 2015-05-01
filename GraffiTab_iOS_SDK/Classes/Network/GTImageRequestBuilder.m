//
//  GTImageRequestBuilder.m
//  GraffiTabiOSSDK
//
//  Created by Georgi Christov on 30/04/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTImageRequestBuilder.h"
#import "GTRequestBuilder.h"

@implementation GTImageRequestBuilder

#pragma mark - User images

+ (NSString *)buildGetAvatar:(long)avatarId {
    return [GTRequestBuilder buildGetAvatar:avatarId];
}

+ (NSString *)buildGetAvatarForUsername:(NSString *)username {
    return [GTRequestBuilder buildGetAvatarForUsername:username];
}

+ (NSString *)buildGetCover:(long)coverId {
    return [GTRequestBuilder buildGetCover:coverId];
}

#pragma mark - Streamable item images

+ (NSString *)buildGetGraffiti:(long)graffitiId {
    return [GTRequestBuilder buildGetGraffiti:graffitiId];
}

+ (NSString *)buildGetFullGraffiti:(long)graffitiId {
    return [GTRequestBuilder buildGetFullGraffiti:graffitiId];
}

#pragma mark - Conversatino images

+ (NSString *)buildGetConversationImage:(long)imageId {
    return [GTRequestBuilder buildGetConversationImage:imageId];
}

@end
