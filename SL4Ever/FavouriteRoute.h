//
//  FavouriteRoute.h
//  SL4Ever
//
//  Created by Rikard on 27/06/14.
//  Copyright (c) 2014 Rikard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Station.h"

@interface FavouriteRoute : NSObject

@property Station* originStation;
@property Station* destinationStation;
@property NSString* name;

@end
