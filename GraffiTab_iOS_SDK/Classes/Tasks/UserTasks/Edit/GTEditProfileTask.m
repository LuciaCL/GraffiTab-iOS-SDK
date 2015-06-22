//
//  EditProfileTask.m
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 17/04/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTEditProfileTask.h"

@implementation GTEditProfileTask

- (void)editProfileWithFirstName:(NSString *)firstName lastName:(NSString *)lastName email:(NSString *)email about:(NSString *)about website:(NSString *)website successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    self.sBlock = successBlock;
    self.fBlock = failureBlock;
    
    NSString *string = [GTRequestBuilder buildEditProfile];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{JSON_REQ_USER_FIRST_NAME:firstName,
                                                                                  JSON_REQ_USER_LAST_NAME:lastName,
                                                                                  JSON_REQ_GENERIC_EMAIL:email}];
    
    if (about && about.length > 0)
        params[JSON_REQ_USER_ABOUT] = about;
    if (website && website.length > 0)
        params[JSON_REQ_USER_WEBSITE] = website;
    
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
    
    [[GTSettings getInstance] setUser:p];
    
    return p;
}

@end
