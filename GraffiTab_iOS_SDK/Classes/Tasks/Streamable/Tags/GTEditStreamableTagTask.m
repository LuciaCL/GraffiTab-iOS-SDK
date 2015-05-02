//
//  GTEditStreamableTagTask.m
//  GraffiTab_iOS_SDK
//
//  Created by Georgi Christov on 02/05/2015.
//  Copyright (c) 2015 GraffiTab. All rights reserved.
//

#import "GTEditStreamableTagTask.h"

@implementation GTEditStreamableTagTask

- (void)editTagWithId:(long)itemId image:(UIImage *)image location:(CLLocation *)location successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    self.sBlock = successBlock;
    self.fBlock = failureBlock;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString *string = [GTRequestBuilder buildEditTag];
        
        NSData *imageData = UIImageJPEGRepresentation(image, COMPRESSION_QUALITY);
        NSString *encodedString = [imageData base64EncodedStringWithOptions:0];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{JSON_REQ_STREAMABLE_ID:@(itemId),
                                                                                          JSON_REQ_GENERIC_LATITUDE:@(location.coordinate.latitude),
                                                                                          JSON_REQ_GENERIC_LONGITUDE:@(location.coordinate.longitude),
                                                                                          JSON_REQ_GENERIC_ENCODED_IMAGE:encodedString}];
            
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
        });
    });
}

- (id)parseJsonSuccessObject:(NSDictionary *)json {
    GTStreamable *p = [GTStreamableFactory createStreamableFromJson:json[JSON_RESP_STREAMABLE_STREAMABLE]];
    
    return p;
}

@end
