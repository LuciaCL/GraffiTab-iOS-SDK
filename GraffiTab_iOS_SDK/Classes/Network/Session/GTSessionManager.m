//
//  GTSessionManager.m
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 26/11/2014.
//  Copyright (c) 2014 GraffiTab. All rights reserved.
//

#import "GTSessionManager.h"

@implementation GTSessionManager

static GTSessionManager *manager;

+ (GTSessionManager *)manager {
    @synchronized(self) {
        static dispatch_once_t pred;
        dispatch_once(&pred, ^{
            manager = [[self alloc] initWithBaseURL:[NSURL URLWithString:API_APP_URL]];
            
            manager.responseSerializer = [AFJSONResponseSerializer serializer];
            manager.requestSerializer = [AFJSONRequestSerializer new];
        });
    }
    
    return manager;
}

@end
