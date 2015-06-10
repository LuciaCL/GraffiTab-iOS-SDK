//
//  RequestBuilder.m
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 17/10/2014.
//  Copyright (c) 2014 GraffiTab. All rights reserved.
//

#import "GTRequestBuilder.h"

@implementation GTRequestBuilder

#pragma mark - User

+ (NSString *)buildResetPassword {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_USER_RESET_PASSWORD];
}

+ (NSString *)buildSignUp {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_USER_REGISTER];
}

+ (NSString *)buildLogin {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_USER_LOGIN];
}

+ (NSString *)buildLogout {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_USER_LOGOUT];
}

+ (NSString *)buildVerify {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_USER_VERIFY_EXTERNAL_USER];
}

+ (NSString *)buildLinkExternalId {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_USER_LINK_EXTERNAL_ID];
}

+ (NSString *)buildEditAvatar {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_USER_EDIT_AVATAR];
}

+ (NSString *)buildEditCover {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_USER_EDIT_COVER];
}

+ (NSString *)buildEditProfile {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_USER_EDIT_PROFILE];
}

+ (NSString *)buildEditPassword {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_USER_EDIT_PASSWORD];
}

+ (NSString *)buildCheckLoginStatus {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_USER_CHECK_LOGIN_STATUS];
}

+ (NSString *)buildGetAvatar:(long)avatarId {
    return [NSString stringWithFormat:@"%@%@?%@=%li", [self buildAPIUrl], API_USER_GET_AVATAR_IMAGE, JSON_REQ_AVATAR_ID, avatarId];
}

+ (NSString *)buildGetAvatarForUsername:(NSString *)username {
    return [NSString stringWithFormat:@"%@%@?%@=%@", [self buildAPIUrl], API_USER_GET_AVATAR_IMAGE_FOR_USERNAME, JSON_REQ_USER_USERNAME, username];
}

+ (NSString *)buildGetCover:(long)coverId {
    return [NSString stringWithFormat:@"%@%@?%@=%li", [self buildAPIUrl], API_USER_GET_COVER_IMAGE, JSON_REQ_COVER_ID, coverId];
}

+ (NSString *)buildFindSocialFriends {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_USER_FIND_SOCIAL_NETWORK_FRIENDS];
}

+ (NSString *)buildFindUserForUsername {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_USER_FIND_FOR_USERNAME];
}

+ (NSString *)buildFollow {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_USER_FOLLOW];
}

+ (NSString *)buildUnfollow {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_USER_UNFOLLOW];
}

+ (NSString *)buildGetMostActiveUsers {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_USER_GET_MOST_ACTIVE];
}

+ (NSString *)buildGetFollowers {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_USER_GET_FOLLOWERS];
}

+ (NSString *)buildGetFollowing {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_USER_GET_FOLLOWING];
}

+ (NSString *)buildGetFullProfile {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_USER_FULL_PROFILE];
}

#pragma mark - Search

+ (NSString *)buildSearchUsers {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_SEARCH_USER];
}

+ (NSString *)buildSearchHashtag {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_SEARCH_HASHTAG];
}

+ (NSString *)buildSearchHashtags {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_SEARCH_HASHTAGS];
}

#pragma mark - Device

+ (NSString *)buildRegisterDevice {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_DEVICE_REGISTER];
}

+ (NSString *)buildUnregisterDevice {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_DEVICE_UNREGISTER];
}

#pragma mark - Notifications

+ (NSString *)buildGetNotifications {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_NOTIFICATION_GET];
}

+ (NSString *)buildGetUnseenNotifications {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_NOTIFICATION_GET_UNSEEN_COUNT];
}

#pragma mark - Activity

+ (NSString *)buildGetActivity {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_ACTIVITY_GET];
}

#pragma mark - Streamables

+ (NSString *)buildGetGraffiti:(long)graffitiId {
    return [NSString stringWithFormat:@"%@%@?%@=%li", [self buildAPIUrl], API_STREAMABLE_TAG_GET_THUMBNAIL, JSON_REQ_STREAMABLE_TAG_GRAFFITI_THUMBNAIL_ID, graffitiId];
}

+ (NSString *)buildGetFullGraffiti:(long)graffitiId {
    return [NSString stringWithFormat:@"%@%@?%@=%li", [self buildAPIUrl], API_STREAMABLE_TAG_GET_IMAGE, JSON_REQ_STREAMABLE_TAG_GRAFFITI_ID, graffitiId];
}

+ (NSString *)buildCreateTag {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_STREAMABLE_TAG_CREATE];
}

+ (NSString *)buildEditTag {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_STREAMABLE_TAG_EDIT];
}

+ (NSString *)buildGetUserItems {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_STREAMABLE_USER_STREAM];
}

+ (NSString *)buildGetFavouriteUserItems {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_STREAMABLE_USER_FAVOURITES];
}

+ (NSString *)buildGetNewestItems {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_STREAMABLE_LATEST];
}

+ (NSString *)buildGetPrivateItems {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_STREAMABLE_GET_PRIVATE];
}

+ (NSString *)buildGetItemsForLocation {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_STREAMABLE_TAG_GET_FOR_LOCATION];
}

+ (NSString *)buildGetUserHomeStreamItems {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_STREAMABLE_HOME_STREAM];
}

+ (NSString *)buildGetPopularItems {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_STREAMABLE_POPULAR];
}

+ (NSString *)buildLikeItem {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_STREAMABLE_LIKES_LIKE];
}

+ (NSString *)buildUnlikeItem {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_STREAMABLE_LIKES_UNLIKE];
}

+ (NSString *)buildGetLikers {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_STREAMABLE_LIKES_GET];
}

+ (NSString *)buildFlagItem {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_STREAMABLE_FLAG];
}

+ (NSString *)buildMakeItemPublic {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_STREAMABLE_MAKE_PUBLIC];
}

+ (NSString *)buildMakeItemPrivate {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_STREAMABLE_MAKE_PRIVATE];
}

+ (NSString *)buildDeleteStreamable {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_STREAMABLE_DELETE];
}

#pragma mark - Conversations

+ (NSString *)buildCreateConversation {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_CONVERSATION_CREATE];
}

+ (NSString *)buildLeaveConversation {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_CONVERSATION_LEAVE];
}

+ (NSString *)buildGetConversations {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_CONVERSATION_GET];
}

+ (NSString *)buildGetMessages {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_CONVERSATION_GET_MESSAGES];
}

+ (NSString *)buildPostMessage {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_CONVERSATION_POST_MESSAGE];
}

+ (NSString *)buildShowTypingIndicator {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_CONVERSATION_SHOW_TYPING_INDICATOR];
}

+ (NSString *)buildHideTypingIndicator {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_CONVERSATION_HIDE_TYPING_INDICATOR];
}

+ (NSString *)buildGetUnseenConversations {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_CONVERSATION_GET_UNSEEN_COUNT];
}

+ (NSString *)buildEditMessage {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_MESSAGE_EDIT];
}

+ (NSString *)buildDeleteMessages {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_MESSAGE_DELETE];
}

+ (NSString *)buildEditConversationName {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_CONVERSATION_EDIT_NAME];
}

+ (NSString *)buildEditConversationImage {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_CONVERSATION_EDIT_IMAGE];
}

+ (NSString *)buildAddConversationUsers {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_CONVERSATION_ADD_USERS];
}

+ (NSString *)buildGetConversationImage:(long)imageId {
    return [NSString stringWithFormat:@"%@%@?%@=%li", [self buildAPIUrl], API_CONVERSATION_GET_IMAGE, JSON_REQ_CONVERSATION_IMAGE_ID, imageId];
}

#pragma mark - Locations

+ (NSString *)buildGetUserLocations {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_LOCATION_GET];
}

+ (NSString *)buildCreateUserLocation {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_LOCATION_CREATE];
}

+ (NSString *)buildDeleteUserLocations {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_LOCATION_DELETE];
}

#pragma mark - Comments

+ (NSString *)buildPostComment {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_STREAMABLE_COMMENTS_POST];
}

+ (NSString *)buildEditComment {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_STREAMABLE_COMMENTS_EDIT];
}

+ (NSString *)buildGetComments {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_STREAMABLE_COMMENTS_GET];
}

+ (NSString *)buildDeleteComments {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_STREAMABLE_COMMENTS_DELETE];
}

#pragma mark - Feedback

+ (NSString *)buildPostFeedback {
    return [NSString stringWithFormat:@"%@%@", [self buildAPIUrl], API_FEEDBACK_SEND];
}

#pragma mark - API url

+ (NSString *)buildAPIUrl {
    return [NSString stringWithFormat:@"%@/%@", API_APP_URL, API_APP_API_URL];
}

@end
