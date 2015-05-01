//
//  LinkExternalIdTask.m
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 04/12/2014.
//  Copyright (c) 2014 GraffiTab. All rights reserved.
//

#import "GTLinkExternalIdTask.h"

@implementation GTLinkExternalIdTask

- (void)linkExternalId:(NSString *)externalId successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    self.sBlock = successBlock;
    self.fBlock = failureBlock;
    
    NSString *string = [GTRequestBuilder buildLinkExternalId];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{JSON_REQ_USER_EXTERNAL_ID:externalId}];
    
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
    GTPerson *p = [[GTPerson alloc] initFromJson:json[JSON_RESP_USER_USER]];
    
    [[GTSettings getInstance] setUser:p];
    
    return p;
}

@end
