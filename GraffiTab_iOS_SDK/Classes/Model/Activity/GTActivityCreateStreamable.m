//
//  GTActivityCreateStreamable.m
//  GraffiTab_iOS_SDK
//
//  Created by Georgi Christov on 08/05/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTActivityCreateStreamable.h"

@implementation GTActivityCreateStreamable

- (id)initFromJson:(NSDictionary *)json {
    self = [super initFromJson:json];
    
    if (self) {
        self.creator = [[GTPerson alloc] initFromJson:json[JSON_ACTIVITY_CREATE_STREAMABLE_CREATOR]];
        self.item = [GTStreamableFactory createStreamableFromJson:json[JSON_ACTIVITY_CREATE_STREAMABLE_ITEM]];
    }
    
    return self;
}

- (NSDictionary *)asDictionary {
    NSMutableDictionary *json = [NSMutableDictionary dictionaryWithDictionary:[super asDictionary]];
    
    json[JSON_ACTIVITY_CREATE_STREAMABLE_CREATOR] = self.creator.asDictionary;
    json[JSON_ACTIVITY_CREATE_STREAMABLE_ITEM] = self.item.asDictionary;
    
    return json;
}

@end
