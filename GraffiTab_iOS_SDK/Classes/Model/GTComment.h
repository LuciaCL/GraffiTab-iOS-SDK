//
//  Comment.h
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 04/12/2014.
//  Copyright (c) 2014 GraffiTab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GTComment : NSObject <GTJSONSerializable>

@property (nonatomic, assign) long commentId;
@property (nonatomic, assign) long itemId;
@property (nonatomic, strong) GTPerson *user;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, strong) NSDate *date;

- (id)initFromJson:(NSDictionary *)json;

@end
