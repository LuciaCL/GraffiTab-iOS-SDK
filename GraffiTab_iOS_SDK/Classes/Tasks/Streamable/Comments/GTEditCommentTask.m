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
    
    // Setup and fire off request.
    NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];
    NSDictionary *sheaders = [NSHTTPCookie requestHeaderFieldsWithCookies:cookies];
    
    NSString *charset = (NSString *)CFStringConvertEncodingToIANACharSetName(CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:string] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:60.f];
    
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
}

- (id)parseJsonSuccessObject:(NSDictionary *)json {
    GTComment *p = [[GTComment alloc] initFromJson:json[JSON_RESP_COMMENT_COMMENT]];
    
    return p;
}

@end
