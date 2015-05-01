//
//  GTConversationManager.h
//  GraffiTabiOSSDK
//
//  Created by Georgi Christov on 29/04/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GTConversationManager : NSObject

+ (void)addConversationUsersWithConversationId:(long)conversationId receiverIds:(NSMutableArray *)receiverIds successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;
+ (void)createConversationWithText:(NSString *)msg title:(NSString *)title receiverIds:(NSMutableArray *)receiverIds image:(UIImage *)image successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;
+ (void)editConversationImageWithConversationId:(long)conversationId image:(UIImage *)image successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;
+ (void)editConversationTitleWithId:(long)conversationId text:(NSString *)text successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;
+ (void)getConversationsWithStart:(int)start numberOfItems:(int)count useCache:(BOOL)useCache successBlock:(void (^)(GTResponseObject *))successBlock cacheBlock:(void (^)(GTResponseObject *))cacheBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;
+ (void)getMessagesWithConversationId:(long)conversationId start:(int)start numberOfItems:(int)count useCache:(BOOL)useCache successBlock:(void (^)(GTResponseObject *))successBlock cacheBlock:(void (^)(GTResponseObject *))cacheBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;
+ (void)getUnseenConversationsCountWithSuccessBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;
+ (void)hideTypingIndicatorForConversationId:(long)conversationId successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;
+ (void)leaveConversation:(long)conversationId successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;
+ (void)postMessageWithText:(NSString *)msg conversationId:(long)conversationId successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;
+ (void)showTypingIndicatorForConversationId:(long)conversationId successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;

#pragma mark - Messages

+ (void)deleteMessages:(NSMutableArray *)ids successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;
+ (void)editMessageWithId:(long)messageId text:(NSString *)text successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock;

@end
