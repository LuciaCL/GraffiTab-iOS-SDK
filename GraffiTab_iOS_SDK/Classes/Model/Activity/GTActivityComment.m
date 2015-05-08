//
//  GTActivityComment.m
//  GraffiTab_iOS_SDK
//
//  Created by Georgi Christov on 08/05/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTActivityComment.h"

@implementation GTActivityComment

- (id)initFromJson:(NSDictionary *)json {
    self = [super initFromJson:json];
    
    if (self) {
        self.commenter = [[GTPerson alloc] initFromJson:json[JSON_ACTIVITY_COMMENT_COMMENTER]];
        self.item = [GTStreamableFactory createStreamableFromJson:json[JSON_ACTIVITY_COMMENT_ITEM]];
        self.comment = [[GTComment alloc] initFromJson:json[JSON_ACTIVITY_COMMENT_COMMENT]];
    }
    
    return self;
}

- (NSDictionary *)asDictionary {
    NSMutableDictionary *json = [NSMutableDictionary dictionaryWithDictionary:[super asDictionary]];
    
    json[JSON_ACTIVITY_COMMENT_COMMENTER] = self.commenter.asDictionary;
    json[JSON_ACTIVITY_COMMENT_ITEM] = self.item.asDictionary;
    json[JSON_ACTIVITY_COMMENT_COMMENT] = self.comment.asDictionary;
    
    return json;
}

@end
