//
//  GTActivityLike.h
//  GraffiTab_iOS_SDK
//
//  Created by Georgi Christov on 08/05/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTActivity.h"

@interface GTActivityLike : GTActivity

@property (nonatomic, strong) GTStreamable *item;
@property (nonatomic, strong) GTPerson *liker;

@end
