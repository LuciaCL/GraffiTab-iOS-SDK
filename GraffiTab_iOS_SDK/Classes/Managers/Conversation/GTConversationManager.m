//
//  GTConversationManager.m
//  GraffiTabiOSSDK
//
//  Created by Georgi Christov on 29/04/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTConversationManager.h"
#import "GTDeleteMessagesTask.h"
#import "GTEditMessageTask.h"
#import "GTAddConversationUsersTask.h"
#import "GTCreateConversationTask.h"
#import "GTEditConversationImageTask.h"
#import "GTEditConversationNameTask.h"
#import "GTGetConversationsTask.h"
#import "GTGetMessagesTask.h"
#import "GTGetUnseenConversationsTask.h"
#import "GTHideTypingIndicatorTask.h"
#import "GTLeaveConversationTask.h"
#import "GTPostMessageTask.h"
#import "GTShowTypingIndicatorTask.h"

@implementation GTConversationManager

+ (void)addConversationUsersWithConversationId:(long)conversationId receiverIds:(NSMutableArray *)receiverIds successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTAddConversationUsersTask *task = [GTAddConversationUsersTask new];
    [task addConversationUsersWithConversationId:conversationId receiverIds:receiverIds successBlock:successBlock failureBlock:failureBlock];
}

+ (void)createConversationWithText:(NSString *)msg title:(NSString *)title receiverIds:(NSMutableArray *)receiverIds image:(UIImage *)image successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTCreateConversationTask *task =[GTCreateConversationTask new];
    [task createConversationWithText:msg title:title receiverIds:receiverIds image:image successBlock:successBlock failureBlock:failureBlock];
}

+ (void)editConversationImageWithConversationId:(long)conversationId image:(UIImage *)image successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTEditConversationImageTask *task = [GTEditConversationImageTask new];
    [task editConversationImageWithConversationId:conversationId image:image successBlock:successBlock failureBlock:failureBlock];
}

+ (void)editConversationTitleWithId:(long)conversationId text:(NSString *)text successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTEditConversationNameTask *task = [GTEditConversationNameTask new];
    [task editConversationTitleWithId:conversationId text:text successBlock:successBlock failureBlock:failureBlock];
}

+ (void)getConversationsWithStart:(int)start numberOfItems:(int)count useCache:(BOOL)useCache successBlock:(void (^)(GTResponseObject *))successBlock cacheBlock:(void (^)(GTResponseObject *))cacheBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTGetConversationsTask *task = [GTGetConversationsTask new];
    task.isStart = useCache;
    [task getConversationsWithStart:start numberOfItems:count successBlock:successBlock cacheBlock:cacheBlock failureBlock:failureBlock];
}

+ (void)getMessagesWithConversationId:(long)conversationId start:(int)start numberOfItems:(int)count useCache:(BOOL)useCache successBlock:(void (^)(GTResponseObject *))successBlock cacheBlock:(void (^)(GTResponseObject *))cacheBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTGetMessagesTask *task = [GTGetMessagesTask new];
    task.isStart = useCache;
    [task getMessagesWithConversationId:conversationId start:start numberOfItems:count successBlock:successBlock cacheBlock:cacheBlock failureBlock:failureBlock];
}

+ (void)getUnseenConversationsCountWithSuccessBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTGetUnseenConversationsTask *task = [GTGetUnseenConversationsTask new];
    [task getUnseenConversationsCountWithSuccessBlock:successBlock failureBlock:failureBlock];
}

+ (void)hideTypingIndicatorForConversationId:(long)conversationId successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTHideTypingIndicatorTask *task = [GTHideTypingIndicatorTask new];
    [task hideTypingIndicatorForConversationId:conversationId successBlock:successBlock failureBlock:failureBlock];
}

+ (void)leaveConversation:(long)conversationId successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTLeaveConversationTask *task = [GTLeaveConversationTask new];
    [task leaveConversation:conversationId successBlock:successBlock failureBlock:failureBlock];
}

+ (void)postMessageWithText:(NSString *)msg conversationId:(long)conversationId successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTPostMessageTask *task = [GTPostMessageTask new];
    [task postMessageWithText:msg conversationId:conversationId successBlock:successBlock failureBlock:failureBlock];
}

+ (void)showTypingIndicatorForConversationId:(long)conversationId successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTShowTypingIndicatorTask *task = [GTShowTypingIndicatorTask new];
    [task showTypingIndicatorForConversationId:conversationId successBlock:successBlock failureBlock:failureBlock];
}

#pragma mark - Messages

+ (void)deleteMessages:(NSMutableArray *)ids successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTDeleteMessagesTask *task = [GTDeleteMessagesTask new];
    [task deleteMessages:ids successBlock:successBlock failureBlock:failureBlock];
}

+ (void)editMessageWithId:(long)messageId text:(NSString *)text successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    GTEditMessageTask *task = [GTEditMessageTask new];
    [task editMessageWithId:messageId text:text successBlock:successBlock failureBlock:failureBlock];
}

@end
