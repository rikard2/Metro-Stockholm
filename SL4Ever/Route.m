//
//  Route.m
//  SL4Ever
//
//  Created by Rikard on 26/06/14.
//  Copyright (c) 2014 Rikard. All rights reserved.
//

#import "Route.h"

@implementation Route

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.subRoutes = [NSMutableArray array];
        self.originDatesFuture = [NSMutableArray array];
        self.destDatesFututes = [NSMutableArray array];
    }
    return self;
}

- (void) setStations :(Station*)origin :(Station*)destination {
    self.originStation = origin;
    self.destinationStation = destination;
}

- (void) setDates :(NSDate*)origin :(NSDate*)destination {
    self.originDate = origin;
    self.destDate = destination;
}

+ (BOOL) sameRoutes :(Route*)route1 :(Route*)route2 {
    return TRUE;
}
@end
