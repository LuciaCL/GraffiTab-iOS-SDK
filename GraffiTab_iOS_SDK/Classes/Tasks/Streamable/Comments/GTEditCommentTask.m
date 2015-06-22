//
//  EditCommentTask.m
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 29/03/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTEditCommentTask.h"

@implementation GTEditCommentTask

- (void)editCommentWithId:(long)commentId text:(NSString *)text successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    self.sBlock = successBlock;
    self.fBlock = failureBlock;
    
    NSString *string = [GTRequestBuilder buildEditComment];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{JSON_REQ_COMMENT_ID:@(commentId),
                                                                                  JSON_REQ_GENERIC_TEXT:text}];
    
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
    GTComment *p = [[GTComment alloc] initFromJson:json[JSON_RESP_COMMENT_COMMENT]];
    
    return p;
}

@end
