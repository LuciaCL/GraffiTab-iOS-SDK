//
//  GTSessionManager.h
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 26/11/2014.
//  Copyright (c) 2014 GraffiTab. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface GTSessionManager : AFHTTPSessionManager

+ (GTSessionManager *)manager;

@end
