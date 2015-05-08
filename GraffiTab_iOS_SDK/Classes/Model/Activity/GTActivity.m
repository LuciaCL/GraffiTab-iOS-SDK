//
//  GTActivity.m
//  GraffiTab_iOS_SDK
//
//  Created by Georgi Christov on 08/05/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTActivity.h"

@implementation GTActivity

- (id)initFromJson:(NSDictionary *)json {
    self = [super init];
    
    if (self) {
        self.activityId = [json[JSON_ACTIVITY_ID] longValue];
        self.user = [[GTPerson alloc] initFromJson:json[JSON_ACTIVITY_USER]];
        self.date = [NSDate dateWithTimeIntervalSince1970:[json[JSON_ACTIVITY_DATE] longValue] / 1000];
        self.type = ActivityType(json[JSON_ACTIVITY_TYPE]);
    }
    
    return self;
}

- (NSDictionary *)asDictionary {
    NSMutableDictionary *json = [NSMutableDictionary new];
    
    json[JSON_ACTIVITY_ID] = @(self.activityId);
    json[JSON_ACTIVITY_USER] = self.user.asDictionary;
    json[JSON_ACTIVITY_DATE] = @(self.date.timeIntervalSince1970);
    json[JSON_ACTIVITY_TYPE] = ACTIVITY_TYPE_FROM_OBJ_C[ACTIVITY_TYPE_LIST[self.type]];
    
    return json;
}

- (BOOL)isEqual:(id)other {
    if (other == self)
        return YES;
    if (!other || ![other isKindOfClass:[self class]])
        return NO;
    return [self isEqualToWidget:other];
}

- (BOOL)isEqualToWidget:(GTActivity *)aWidget {
    if (self == aWidget)
        return YES;
    if (self.activityId != aWidget.activityId)
        return NO;
    return YES;
}

@end
