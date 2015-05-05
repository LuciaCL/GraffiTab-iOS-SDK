//
//  FollowTask.m
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 03/12/2014.
//  Copyright (c) 2014 GraffiTab. All rights reserved.
//

#import "GTFollowTask.h"

@implementation GTFollowTask

- (void)followUserWithId:(long)userId successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    self.sBlock = successBlock;
    self.fBlock = failureBlock;
    
    NSString *string = [GTRequestBuilder buildFollow];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{JSON_REQ_USER_ID:@(userId)}];
    
    [GTSessionManager.manager POST:string parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary *responseJson = responseObject;
        
        [self parseJsonSuccess:responseJson];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
        NSInteger statuscode = response.statusCode;
        
        [self parseJsonError:statuscode];
    }];
}

- (id)parseJsonSuccessObject:(NSDictionary *)json {
    GTPerson *p = [[GTPerson alloc] initFromJson:json[JSON_RESP_USER_USER]];
    
    return p;
}

@end
