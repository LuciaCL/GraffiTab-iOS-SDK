//
//  UserLocation.h
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 11/12/2014.
//  Copyright (c) 2014 GraffiTab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GTUserLocation : NSObject <GTJSONSerializable>

@property (nonatomic, assign) long locationId;
@property (nonatomic, strong) GTPerson *user;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, assign) CLLocationDegrees latitude;
@property (nonatomic, assign) CLLocationDegrees longitude;

- (id)initFromJson:(NSDictionary *)json;

@end
