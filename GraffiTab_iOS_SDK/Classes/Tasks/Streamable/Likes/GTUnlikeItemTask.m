//
//  UnlikeItemTask.m
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 05/12/2014.
//  Copyright (c) 2014 GraffiTab. All rights reserved.
//

#import "GTUnlikeItemTask.h"

@implementation GTUnlikeItemTask

- (void)unlikeItemWithId:(long)itemId successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    self.sBlock = successBlock;
    self.fBlock = failureBlock;
    
    NSString *string = [GTRequestBuilder buildUnlikeItem];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{JSON_REQ_STREAMABLE_ID:@(itemId)}];
    
    [GTSessionManager.manager POST:string parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary *responseJson = responseObject;
        
        [self parseJsonSuccess:responseJson];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (error.userInfo[JSONResponseSerializerWithDataKey]) {
            NSData *data = error.userInfo[JSONResponseSerializerWithDataKey];
            
            NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data
                                                                 options:kNilOptions
                                                                   error:&error];
            
            [self parseJsonError:json];
        }
        else
            [self parseJsonError:nil];
    }];
}

- (id)parseJsonSuccessObject:(NSDictionary *)json {
    GTStreamable *p = [GTStreamableFactory createStreamableFromJson:json[JSON_RESP_STREAMABLE_STREAMABLE]];
    
    return p;
}

@end
