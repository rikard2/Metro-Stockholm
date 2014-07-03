//
//  Helper.h
//  SL4Ever
//
//  Created by Rikard on 27/06/14.
//  Copyright (c) 2014 Rikard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FavouriteRoute.h"

@interface Helper : NSObject

+ (NSString*)nowTime;
+ (NSString*)dateTime :(NSDate*)date;
+ (NSMutableArray*)positions;
+ (NSMutableArray*)times;

+ (NSInteger) activeOriginPosition;
+ (NSInteger) activeDestPosition;
+ (void) setActiveTime :(NSInteger)index;
+ (void) setActiveOriginPosition :(NSInteger)originIndex;
+ (void) setActiveDestPosition :(NSInteger)destIndex;
+ (NSInteger) activeTime;


+ (NSMutableArray*) userFavourites;
+ (void) addUserFavourite :(FavouriteRoute*)fr;
+ (NSMutableArray*) removeUserFavourite :(NSInteger)favouriteIndex;

@end
