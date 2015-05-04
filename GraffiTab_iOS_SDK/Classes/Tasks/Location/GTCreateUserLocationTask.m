//
//  GTCreateUserLocationTask.m
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 11/12/2014.
//  Copyright (c) 2014 GraffiTab. All rights reserved.
//

#import "GTCreateUserLocationTask.h"
#import <AddressBookUI/AddressBookUI.h>

@implementation GTCreateUserLocationTask

- (void)createLocationWithPlacemark:(CLPlacemark *)placemark successBlock:(void (^)(GTResponseObject *))successBlock failureBlock:(void (^)(GTResponseObject *))failureBlock {
    self.sBlock = successBlock;
    self.fBlock = failureBlock;
    
    NSString *string = [GTRequestBuilder buildCreateUserLocation];
    
    NSString *addressTxt = ABCreateStringWithAddressDictionary(placemark.addressDictionary, NO);
    NSString *newString = [[addressTxt componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]] componentsJoinedByString:@", "];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{JSON_REQ_LOCATION_ADDRESS:newString,
                                                                                  JSON_REQ_GENERIC_LATITUDE:@(placemark.location.coordinate.latitude),
                                                                                  JSON_REQ_GENERIC_LONGITUDE:@(placemark.location.coordinate.longitude)}];
    
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
    GTUserLocation *p = [[GTUserLocation alloc] initFromJson:json[JSON_RESP_LOCATION_LOCATION]];
    
    return p;
}

@end
