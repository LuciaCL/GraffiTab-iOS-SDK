//
//  Conversation.h
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 10/04/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GTConversation : NSObject <GTJSONSerializable>

@property (nonatomic, assign) long conversationId;
@property (nonatomic, assign) long imageId;
@property (nonatomic, assign) int unseenMessagesCount;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) GTConversationMessage *lastMessage;
@property (nonatomic, strong) NSMutableArray *members;

- (id)initFromJson:(NSDictionary *)json;

- (GTPerson *)findMemberForId:(long)userId;
- (NSMutableArray *)findOtherMembers;
- (NSString *)getGroupChatTitle;

@end
