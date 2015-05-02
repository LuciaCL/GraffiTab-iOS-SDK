//
//  GTPostMessageTask.m
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 04/04/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTPostMessageTask.h"

@implementation GTPostMessageTask

- (void)postMessageWithText:(NSString *)msg conversationId:(long)conversationId successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    self.sBlock = successBlock;
    self.fBlock = failureBlock;
    
    NSString *string = [GTRequestBuilder buildPostMessage];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{JSON_REQ_CONVERSATION_ID:@(conversationId),
                                                                                  JSON_REQ_GENERIC_TEXT:msg}];
    
    // Define web request.
    void (^simpleBlock)(void) = ^{
        // Setup and fire off request.
        NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];
        NSDictionary *sheaders = [NSHTTPCookie requestHeaderFieldsWithCookies:cookies];
        
        NSString *charset = (NSString *)CFStringConvertEncodingToIANACharSetName(CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
        
        __strong NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:string] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:60.f];
        
        [request setHTTPMethod:@"POST"];
        [request setValue:[NSString stringWithFormat:@"application/json; charset=%@", charset] forHTTPHeaderField:@"Content-Type"];
        [request setAllHTTPHeaderFields:sheaders];
        NSURLRequest *r = [[AFJSONRequestSerializer serializer] requestBySerializingRequest:request withParameters:params error:nil];
        
        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:r];
        operation.responseSerializer = [AFJSONResponseSerializer serializer];
        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSDictionary *responseJson = responseObject;
            
            [self parseJsonSuccess:responseJson];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
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
        
        [operation start];
    };
    
    simpleBlock();
}

- (id)parseJsonSuccessObject:(NSDictionary *)json {
    GTConversationMessage *p = [[GTConversationMessage alloc] initFromJson:json[JSON_RESP_MESSAGE_MESSAGE]];
    
    return p;
}

@end
