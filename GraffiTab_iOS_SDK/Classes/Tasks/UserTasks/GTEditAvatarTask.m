//
//  EditAvatarTask.m
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 27/11/2014.
//  Copyright (c) 2014 GraffiTab. All rights reserved.
//

#import "GTEditAvatarTask.h"

@implementation GTEditAvatarTask

- (void)editAvatarWithNewImage:(UIImage *)image successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    self.sBlock = successBlock;
    self.fBlock = failureBlock;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString *string = [GTRequestBuilder buildEditAvatar];
        
        NSString *encodedString;
        if (image) {
            NSData *imageData = UIImageJPEGRepresentation(image, COMPRESSION_QUALITY);
            encodedString = [imageData base64EncodedStringWithOptions:0];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSMutableDictionary *params = [NSMutableDictionary new];
            
            if (encodedString)
                params[JSON_REQ_GENERIC_ENCODED_IMAGE] = encodedString;
            
            GTSessionManager.manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
            
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
    GTPerson *p = [[GTPerson alloc] initFromJson:json[JSON_RESP_USER_USER]];
    
    [[GTSettings getInstance] setUser:p];
    
    return p;
}

@end