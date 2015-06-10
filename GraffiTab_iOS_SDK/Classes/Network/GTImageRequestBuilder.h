//
//  GTImageRequestBuilder.h
//  GraffiTabiOSSDK
//
//  Created by Georgi Christov on 30/04/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GTImageRequestBuilder : NSObject

#pragma mark - User images

+ (NSString *)buildGetAvatar:(long)avatarId;
+ (NSString *)buildGetAvatarForUsername:(NSString *)username;
+ (NSString *)buildGetCover:(long)coverId;

#pragma mark - Streamable item images

+ (NSString *)buildGetGraffiti:(long)graffitiId;
+ (NSString *)buildGetFullGraffiti:(long)graffitiId;

#pragma mark - Conversation images

+ (NSString *)buildGetConversationImage:(long)imageId;

@end
