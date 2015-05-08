//
//  GTActivityContainer.h
//  GraffiTab_iOS_SDK
//
//  Created by Georgi Christov on 08/05/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GTActivityContainer : NSObject <GTJSONSerializable>

@property (nonatomic, strong) GTPerson *activityUser;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, assign) ActivityType type;
@property (nonatomic, strong) NSMutableArray *activities;

- (id)initFromJson:(NSDictionary *)json;

@end
