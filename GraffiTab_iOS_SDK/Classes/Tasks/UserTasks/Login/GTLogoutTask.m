//
//  LogoutTask.m
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 26/11/2014.
//  Copyright (c) 2014 GraffiTab. All rights reserved.
//

#import "GTLogoutTask.h"
#import "GTUnregisterDeviceTask.h"

@implementation GTLogoutTask

- (void)logoutWithSuccessBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    self.sBlock = successBlock;
    self.fBlock = failureBlock;
    
    // Try unregistering the user's device first.
    NSString *token = [GTSettings getInstance].token;
    
    GTUnregisterDeviceTask *task = [GTUnregisterDeviceTask new];
    [task unregisterDeviceWithToken:token successBlock:^(GTResponseObject *response) {
        NSLog(@"Token unregistered");
        
        // After the token has been succesfully unregistered, logout the user.
        NSString *string = [GTRequestBuilder buildLogout];
        
        [GTSessionManager.manager GET:string parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
            NSDictionary *responseJson = responseObject;
            
            [self parseJsonSuccess:responseJson];
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
            NSInteger statuscode = response.statusCode;
            
            [self parseJsonError:statuscode];
        }];
    } failureBlock:^(GTResponseObject *response) {
        [self parseJsonError:500];
    }];
}

@end