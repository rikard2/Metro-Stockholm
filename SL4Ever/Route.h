//
//  Route.h
//  SL4Ever
//
//  Created by Rikard on 26/06/14.
//  Copyright (c) 2014 Rikard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Station.h"

@interface Route : NSObject

@property Station* originStation;
@property Station* destinationStation;

@property NSDate* originDate;
@property NSString* lineColor;
@property NSDate* destDate;

@property NSMutableArray* originDatesFuture;
@property NSMutableArray* destDatesFututes;

@property NSString* transportType;
@property NSString* transportName;
@property NSString* transportLine;
@property NSString* transportTowards;

@property NSInteger line;
@property NSMutableArray* subRoutes;

- (void) setStations :(Station*)origin :(Station*)destination;
- (void) setDates :(NSDate*)origin :(NSDate*)destination;

+ (BOOL) sameRoutes :(Route*)route1 :(Route*)route2;

@end
