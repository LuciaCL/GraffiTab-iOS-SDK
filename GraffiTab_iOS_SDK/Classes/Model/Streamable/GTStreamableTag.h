//
//  StreamableTag.h
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 04/12/2014.
//  Copyright (c) 2014 GraffiTab. All rights reserved.
//

#import "GTStreamable.h"

@interface GTStreamableTag : GTStreamable

@property (nonatomic, assign) long graffitiId;
@property (nonatomic, assign) CLLocationDegrees latitude;
@property (nonatomic, assign) CLLocationDegrees longitude;

@end
