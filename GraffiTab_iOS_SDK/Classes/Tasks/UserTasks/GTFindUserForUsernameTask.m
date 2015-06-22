//
//  FindUserForUsernameTask.m
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 20/04/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTFindUserForUsernameTask.h"

@implementation GTFindUserForUsernameTask

- (void)findUserForUsername:(NSString *)username successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    self.sBlock = successBlock;
    self.fBlock = failureBlock;
    
    NSString *string = [GTRequestBuilder buildFindUserForUsername];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{JSON_REQ_USER_USERNAME:username}];
    
    [self executePostWithUrl:string parameters:params cachePolicy:NSURLRequestReloadIgnoringLocalCacheData success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *responseJson = responseObject;
        
        [self parseJsonSuccess:responseJson];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSHTTPURLResponse *response = operation.response;
        NSInteger statuscode = response.statusCode;
        
        [self parseJsonError:statuscode];
    }];
}

- (id)parseJsonSuccessObject:(NSDictionary *)json {
    GTPerson *p = [[GTPerson alloc] initFromJson:json[JSON_RESP_USER_USER]];
    
    if ([p isEqual:[GTSettings getInstance].user])
        [[GTSettings getInstance] setUser:p];
    
    return p;
}

@end
