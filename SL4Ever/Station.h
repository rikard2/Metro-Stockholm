//
//  Station.h
//  SL4Ever
//
//  Created by Rikard on 26/06/14.
//  Copyright (c) 2014 Rikard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Station : NSObject

@property NSString* name;
@property NSString* siteId;
@property NSString* saId;
@property NSString* lineColor;

+ (Station*) findStation :(NSString*)siteId;
- (id) init;
- (instancetype) initWithProperties :(NSString*)name :(NSString*)siteid :(NSString*)sa :(NSString*)linecolor;
+ (NSMutableArray*)loadStations;

@end
