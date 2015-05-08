//
//  GTActivityLike.m
//  GraffiTab_iOS_SDK
//
//  Created by Georgi Christov on 08/05/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTActivityLike.h"

@implementation GTActivityLike

- (id)initFromJson:(NSDictionary *)json {
    self = [super initFromJson:json];
    
    if (self) {
        self.item = [GTStreamableFactory createStreamableFromJson:json[JSON_ACTIVITY_LIKE_ITEM]];
        self.liker = [[GTPerson alloc] initFromJson:json[JSON_ACTIVITY_LIKE_LIKER]];
    }
    
    return self;
}

- (NSDictionary *)asDictionary {
    NSMutableDictionary *json = [NSMutableDictionary dictionaryWithDictionary:[super asDictionary]];
    
    json[JSON_ACTIVITY_LIKE_ITEM] = self.item.asDictionary;
    json[JSON_ACTIVITY_LIKE_LIKER] = self.liker.asDictionary;
    
    return json;
}

@end
