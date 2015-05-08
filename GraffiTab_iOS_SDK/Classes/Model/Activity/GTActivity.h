//
//  GTActivity.h
//  GraffiTab_iOS_SDK
//
//  Created by Georgi Christov on 08/05/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    ACTIVITY_COMMENT,
    ACTIVITY_CREATE_STREAMABLE,
    ACTIVITY_FOLLOW,
    ACTIVITY_LIKE
} ActivityType;

#define ACTIVITY_TYPE_LIST @[@"ACTIVITY_COMMENT", @"ACTIVITY_CREATE_STREAMABLE", @"ACTIVITY_FOLLOW", @"ACTIVITY_LIKE"]
#define ACTIVITY_TYPE_TO_OBJ_C @{@"COMMENT":@"ACTIVITY_COMMENT", @"CREATE_STREAMABLE":@"ACTIVITY_CREATE_STREAMABLE", @"FOLLOW":@"ACTIVITY_FOLLOW", @"LIKE":@"ACTIVITY_LIKE"}
#define ACTIVITY_TYPE_FROM_OBJ_C @{@"ACTIVITY_COMMENT":@"COMMENT", @"ACTIVITY_CREATE_STREAMABLE":@"CREATE_STREAMABLE", @"ACTIVITY_FOLLOW":@"FOLLOW", @"ACTIVITY_LIKE":@"LIKE"}

#define ActivityType(str) (ActivityType)[ACTIVITY_TYPE_LIST indexOfObject:str]

@interface GTActivity : NSObject <GTJSONSerializable>

@property (nonatomic, assign) long activityId;
@property (nonatomic, strong) GTPerson *user;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, assign) ActivityType type;

- (id)initFromJson:(NSDictionary *)json;

@end
