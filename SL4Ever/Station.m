//
//  Station.m
//  SL4Ever
//
//  Created by Rikard on 26/06/14.
//  Copyright (c) 2014 Rikard. All rights reserved.
//

#import "Station.h"

@implementation Station


- (instancetype) initWithProperties :(NSString*)name :(NSString*)siteid :(NSString*)sa :(NSString*)lineColor {
    self = [super init];
    
    if (self) {
        self.name = name;
        self.siteId = siteid;
        self.saId = sa;
    }
    
    return self;
}

- (id) init {
    self = [super init];
    
    return self;
}

+ (NSMutableArray*)loadStations {
    NSMutableArray *ret = [NSMutableArray array];
    
    NSLog(@"loading stations");
    NSString *sourceFileString = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"stations" ofType:@"csv"] encoding:NSUTF8StringEncoding error:nil];
    
    NSMutableArray *csvArray = [[NSMutableArray alloc] init];
    
    csvArray = [[sourceFileString componentsSeparatedByString:@"\r"] mutableCopy];

    for (int i = 0; i < csvArray.count; i++) {
        NSString *keysString = [csvArray objectAtIndex:i];
        NSArray *keysArray = [keysString componentsSeparatedByString:@";"];
        
        NSString *lineColor = [keysArray objectAtIndex:2];
        NSString *name = [keysArray objectAtIndex:1];
        NSString *siteId = [keysArray objectAtIndex:3];
        NSString *saId = [keysArray objectAtIndex:5];
        //Station *s = [[Station alloc] init];
        [ret addObject:[[Station alloc] initWithProperties:name :siteId :saId :lineColor]];
    }
    
    return ret;
}

+ (Station*) findStation :(NSString*)siteId {
    NSMutableArray *stations = [Station loadStations];
    
    for (int i = 0; i < stations.count; i++) {
        if ([[((Station*)[stations objectAtIndex:i]) siteId] isEqualToString:siteId ]) {
            return [stations objectAtIndex:i];
        }
    }
    
    return nil;
}
@end
