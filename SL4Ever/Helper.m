//
//  Helper.m
//  SL4Ever
//
//  Created by Rikard on 27/06/14.
//  Copyright (c) 2014 Rikard. All rights reserved.
//

#import "Helper.h"

@implementation Helper

+ (NSString*)nowTime
{
    NSDate *now = [NSDate date];
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        NSDateComponents *dc = [gregorian components:(NSHourCalendarUnit  | NSMinuteCalendarUnit | NSSecondCalendarUnit) fromDate:now];
    
    
    return [NSString stringWithFormat:@"%02d:%02d", dc.hour, dc.minute];
}

+ (NSString*)dateTime :(NSDate*)date
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *dc = [gregorian components:(NSHourCalendarUnit  | NSMinuteCalendarUnit | NSSecondCalendarUnit) fromDate:date];
    
    
    return [NSString stringWithFormat:@"%01d:%02d", dc.hour, dc.minute];
}

+ (NSMutableArray*)positions {
    return [NSMutableArray arrayWithObjects:@"Hemma", @"Jobbet", nil];
}
+ (NSMutableArray*)times {
    return [NSMutableArray arrayWithObjects:@"10 minuter", @"20 minuter", @"30 minuter", @"60 minuter", nil];
}

+ (NSInteger) activeOriginPosition {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [(NSString*)[userDefaults objectForKey:@"activeOriginPosition"] intValue];
}

+ (NSInteger) activeDestPosition {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [(NSString*)[userDefaults objectForKey:@"activeDestPosition"] intValue];
}

+ (NSInteger) activeTime {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [(NSString*)[userDefaults objectForKey:@"activeTime"] intValue];
}

+ (void) setActiveTime :(NSInteger)index {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:[NSString stringWithFormat:@"%d", index] forKey:@"activeTime"];
}
+ (void) setActiveOriginPosition :(NSInteger)originIndex {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:[NSString stringWithFormat:@"%d", originIndex] forKey:@"activeOriginPosition"];
}
+ (void) setActiveDestPosition :(NSInteger)destIndex {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:[NSString stringWithFormat:@"%d", destIndex] forKey:@"activeDestPosition"];
}
+ (NSMutableArray*) userFavourites {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSString *favourites = [userDefaults objectForKey:@"favourites"];
    if (favourites == nil) {
        favourites = @"Hemma|9110;Borta|9118;";
        [userDefaults setObject:favourites forKey:@"favourites"];
    }
    
    favourites = @"Hemma|9187;Föräldrarna|9117;Jobb|9114;Granis|9115";
    // 9300 9189
    
    NSMutableArray *arr = [NSMutableArray array];
    NSMutableArray *favs = [[favourites componentsSeparatedByString:@";"] mutableCopy];
    
    for (int i = 0; i < favs.count; i++) {
        FavouriteRoute *fr = [[FavouriteRoute alloc] init];
        
        NSMutableArray *parts = [[[favs objectAtIndex:i] componentsSeparatedByString:@"|"] mutableCopy];
        if (parts.count < 2) {
            continue;
        }
        fr.name = [parts objectAtIndex:0];
        fr.destinationStation = [Station findStation:[parts objectAtIndex:1]];
        [arr addObject:fr];
    }
    
    return arr;
}

+ (void) addUserFavourite :(FavouriteRoute*)fr {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *favourites = [userDefaults objectForKey:@"favourites"];
    
    favourites = [NSString stringWithFormat:@"%@;%@|%@", favourites, fr.name, fr.destinationStation.siteId];
    
    [userDefaults setObject:favourites forKey:@"favourites"];
}

@end
