//
//  GTActivityFactory.m
//  GraffiTab_iOS_SDK
//
//  Created by Georgi Christov on 08/05/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTActivityFactory.h"

@implementation GTActivityFactory

+ (GTActivity *)createActivityFromJson:(NSDictionary *)json {
    ActivityType type = ActivityType(json[JSON_ACTIVITY_TYPE]);
    
    if (type == ACTIVITY_COMMENT)
        return [[GTActivityComment alloc] initFromJson:json];
    else if (type == ACTIVITY_CREATE_STREAMABLE)
        return [[GTActivityCreateStreamable alloc] initFromJson:json];
    else if (type == ACTIVITY_FOLLOW)
        return [[GTActivityFollow alloc] initFromJson:json];
    else if (type == ACTIVITY_LIKE)
        return [[GTActivityLike alloc] initFromJson:json];
    else
        return [[GTActivity alloc] initFromJson:json];
}

@end
