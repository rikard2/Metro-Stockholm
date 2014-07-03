//
//  TableRouteViewCell.h
//  SL4Ever
//
//  Created by Rikard on 26/06/14.
//  Copyright (c) 2014 Rikard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Route.h"

@interface TableRouteViewCell : UIView
+ (NSInteger)calculateRowHeight :(Route*)route;

@property Route* route;
@end
