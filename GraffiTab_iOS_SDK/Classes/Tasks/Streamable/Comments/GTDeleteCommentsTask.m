//
//  DeleteCommentsTask.m
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 28/03/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTDeleteCommentsTask.h"

@implementation GTDeleteCommentsTask

- (void)deleteComments:(NSMutableArray *)ids successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    self.sBlock = successBlock;
    self.fBlock = failureBlock;
    
    NSString *string = [GTRequestBuilder buildDeleteComments];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{JSON_REQ_COMMENT_IDS:ids}];
    
    [GTSessionManager.manager POST:string parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary *responseJson = responseObject;
        
        [self parseJsonSuccess:responseJson];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
        NSInteger statuscode = response.statusCode;
        
        [self parseJsonError:statuscode];
    }];
}

@end
