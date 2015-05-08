//
//  GTActivityContainer.m
//  GraffiTab_iOS_SDK
//
//  Created by Georgi Christov on 08/05/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTActivityContainer.h"

@implementation GTActivityContainer

- (id)initFromJson:(NSDictionary *)json {
    self = [super init];
    
    if (self) {
        self.activityUser = [[GTPerson alloc] initFromJson:json[JSON_ACTIVITY_CONTAINER_ACTIVITY_USER]];
        self.date = [NSDate dateWithTimeIntervalSince1970:[json[JSON_ACTIVITY_CONTAINER_DATE] longValue] / 1000];
        self.type = ActivityType(json[JSON_ACTIVITY_CONTAINER_TYPE]);
        self.activities = [NSMutableArray new];
        
        NSArray *jsonArray = json[JSON_ACTIVITY_CONTAINER_ACTIVITIES];
        for (NSDictionary *activityJson in jsonArray) {
            GTActivity *a = [GTActivityFactory createActivityFromJson:activityJson];
            [self.activities addObject:a];
        }
    }
    
    return self;
}

- (NSDictionary *)asDictionary {
    NSMutableDictionary *json = [NSMutableDictionary new];
    
    json[JSON_ACTIVITY_CONTAINER_ACTIVITY_USER] = self.activityUser.asDictionary;
    json[JSON_ACTIVITY_CONTAINER_DATE] = @(self.date.timeIntervalSince1970);
    json[JSON_ACTIVITY_CONTAINER_TYPE] = ACTIVITY_TYPE_FROM_OBJ_C[ACTIVITY_TYPE_LIST[self.type]];
    
    NSMutableArray *activitiesJson = [NSMutableArray new];
    for (GTActivity *a in self.activities)
        [activitiesJson addObject:a.asDictionary];
    
    json[JSON_ACTIVITY_CONTAINER_ACTIVITIES] = activitiesJson;
    
    return json;
}

@end
