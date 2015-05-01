//
//  StreamableFactory.m
//  GraffiTab-iOS
//
//  Created by Georgi Christov on 04/12/2014.
//  Copyright (c) 2014 GraffiTab. All rights reserved.
//

#import "GTStreamableFactory.h"

@implementation GTStreamableFactory

+ (GTStreamable *)createStreamableFromJson:(NSDictionary *)json {
    StreamableType type = StreamableType(json[JSON_STREAMABLE_TYPE]);
    
    if (type == TAG)
        return [[GTStreamableTag alloc] initFromJson:json];
    else if (type == VIDEO)
        return [[GTStreamableVideo alloc] initFromJson:json];
    else
        return [[GTStreamable alloc] initFromJson:json];
}

@end
