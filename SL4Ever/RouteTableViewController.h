//
//  RouteTableViewController.h
//  SL4Ever
//
//  Created by Rikard on 22/06/14.
//  Copyright (c) 2014 Rikard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Route.h"

@interface RouteTableViewController : UITableViewController {
    NSMutableArray *routes;
}

@property NSMutableArray *favouriteRoutes;
@property NSInteger orginFavouriteRouteIndex;
@property NSInteger destFavouriteRouteIndex;

- (IBAction)RefreshClick:(id)sender;

- (void) setActiveFavouriteRoute :(NSInteger)originIndex :(NSInteger)destIndex;

@end