//
//  GTMakePublicTask.m
//  GraffiTab_iOS_SDK
//
//  Created by Georgi Christov on 02/05/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTMakePublicTask.h"

@implementation GTMakePublicTask

- (void)makeItemPublicWithId:(long)itemId successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    self.sBlock = successBlock;
    self.fBlock = failureBlock;
    
    NSString *string = [GTRequestBuilder buildMakeItemPublic];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{JSON_REQ_STREAMABLE_ID:@(itemId)}];
    
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
    GTStreamable *p = [GTStreamableFactory createStreamableFromJson:json[JSON_RESP_STREAMABLE_STREAMABLE]];
    
    return p;
}

@end