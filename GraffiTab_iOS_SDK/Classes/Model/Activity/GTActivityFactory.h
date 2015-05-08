//
//  GTActivityFactory.h
//  GraffiTab_iOS_SDK
//
//  Created by Georgi Christov on 08/05/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GTActivityFactory : NSObject

+ (GTActivity *)createActivityFromJson:(NSDictionary *)json;

@end
