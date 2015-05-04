//
//  GTCreateConversationTask.m
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 10/04/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTCreateConversationTask.h"

@implementation GTCreateConversationTask

- (void)createConversationWithText:(NSString *)msg title:(NSString *)title receiverIds:(NSMutableArray *)receiverIds image:(UIImage *)image successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    self.sBlock = successBlock;
    self.fBlock = failureBlock;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString *string = [GTRequestBuilder buildCreateConversation];
        
        NSString *encodedString;
        if (image) {
            NSData *imageData = UIImageJPEGRepresentation(image, COMPRESSION_QUALITY);
            encodedString = [imageData base64EncodedStringWithOptions:0];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{JSON_REQ_CONVERSATION_RECEIVER_IDS:receiverIds,
                                                                                          JSON_REQ_GENERIC_TEXT:msg}];
            
            if (title)
                params[JSON_REQ_CONVERSATION_TITLE] = title;
            if (encodedString)
                params[JSON_REQ_GENERIC_ENCODED_IMAGE] = encodedString;
            
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
        });
    });
}

- (id)parseJsonSuccessObject:(NSDictionary *)json {
    GTConversation *p = [[GTConversation alloc] initFromJson:json[JSON_RESP_CONVERSATION_CONVERSATION]];
    
    return p;
}

@end
