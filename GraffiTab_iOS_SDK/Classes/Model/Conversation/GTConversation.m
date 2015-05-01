//
//  Conversation.m
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 10/04/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTConversation.h"

@implementation GTConversation

- (id)initFromJson:(NSDictionary *)json {
    self = [super init];
    
    if (self) {
        self.conversationId = [json[JSON_CONVERSATION_ID] longValue];
        self.imageId = [json[JSON_CONVERSATION_IMAGE_ID] longValue];
        self.unseenMessagesCount = [json[JSON_CONVERSATION_UNSEEN_MESSAGES_COUNT] intValue];
        self.name = json[JSON_CONVERSATION_NAME];
        self.lastMessage = [[GTConversationMessage alloc] initFromJson:json[JSON_CONVERSATION_LAST_MESSAGE]];
        self.members = [NSMutableArray new];
        
        NSArray *jsonArray = json[JSON_CONVERSATION_MEMBERS];
        for (NSDictionary *personJson in jsonArray) {
            GTPerson *p = [[GTPerson alloc] initFromJson:personJson];
            [self.members addObject:p];
        }
    }
    
    return self;
}

- (NSDictionary *)asDictionary {
    NSMutableDictionary *json = [NSMutableDictionary new];
    
    json[JSON_CONVERSATION_ID] = @(self.conversationId);
    json[JSON_CONVERSATION_IMAGE_ID] = @(self.imageId);
    json[JSON_CONVERSATION_UNSEEN_MESSAGES_COUNT] = @(self.unseenMessagesCount);
    json[JSON_CONVERSATION_NAME] = self.name;
    json[JSON_CONVERSATION_LAST_MESSAGE] = self.lastMessage.asDictionary;
    
    NSMutableArray *membersJson = [NSMutableArray new];
    for (GTPerson *p in self.members)
        [membersJson addObject:p.asDictionary];
    
    json[JSON_CONVERSATION_MEMBERS] = membersJson;
    
    return json;
}

- (GTPerson *)findMemberForId:(long)userId {
    for (GTPerson *p in self.members) {
        if (p.userId == userId)
            return p;
    }
    
    return nil;
}

- (NSMutableArray *)findOtherMembers {
    NSMutableArray *otherMembers = [NSMutableArray new];
    
    for (GTPerson *p in self.members) {
        if (![p isEqual:[GTSettings getInstance].user] || self.members.count == 1)
            [otherMembers addObject:p];
    }

    return otherMembers;
}

- (NSString *)getGroupChatTitle {
    NSMutableString *title = [NSMutableString new];
    NSMutableArray *otherMembers = [self findOtherMembers];
    
    for (GTPerson *p in otherMembers) {
        [title appendString:p.firstname];
        [title appendString:@", "];
    }
    
    return [title substringToIndex:title.length - 2];
}

- (BOOL)isEqual:(id)other {
    if (other == self)
        return YES;
    if (!other || ![other isKindOfClass:[self class]])
        return NO;
    return [self isEqualToWidget:other];
}

- (BOOL)isEqualToWidget:(GTConversation *)aWidget {
    if (self == aWidget)
        return YES;
    if (self.conversationId != aWidget.conversationId)
        return NO;
    return YES;
}

@end
