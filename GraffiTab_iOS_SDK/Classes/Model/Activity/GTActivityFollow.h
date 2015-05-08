//
//  GTActivityFollow.h
//  GraffiTab_iOS_SDK
//
//  Created by Georgi Christov on 08/05/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTActivity.h"

@interface GTActivityFollow : GTActivity

@property (nonatomic, strong) GTPerson *followedUser;
@property (nonatomic, strong) GTPerson *follower;

@end
