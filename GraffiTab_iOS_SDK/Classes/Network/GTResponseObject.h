//
//  ResponseObject.h
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 25/11/2014.
//  Copyright (c) 2014 GraffiTab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GTResponseObject : NSObject

@property (nonatomic, assign) Result result;
@property (nonatomic, assign) Reason reason;
@property (nonatomic, strong) id object;

@end
