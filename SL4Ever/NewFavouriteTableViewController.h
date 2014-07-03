//
//  NewFavouriteTableViewController.h
//  SL4Ever
//
//  Created by Rikard on 29/06/14.
//  Copyright (c) 2014 Rikard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewFavouriteTableViewController : UITableViewController
- (void) setActiveStationIndex :(NSInteger)stationIndex;

@property NSInteger activeStation;
@property NSInteger activePosition;

@property NSMutableArray *stations;
@end
