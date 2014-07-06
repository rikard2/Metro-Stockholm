//
//  RouteTableViewController.m
//  SL4Ever
//
//  Created by Rikard on 22/06/14.
//  Copyright (c) 2014 Rikard. All rights reserved.
//

#import "RouteTableViewController.h"
#import "TableRouteViewCell.h"
#import "TBXML.h"
#import "Helper.h"
#import "Station.h"
#import "FavouriteRoute.h"
#import "Secrets.h"
@interface RouteTableViewController ()

@end

@implementation RouteTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [Helper userFavourites];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    if ([userDefaults objectForKey:@"activePosition"] == nil) {
        [userDefaults setObject:@"0" forKey:@"activePosition"];
    }
    
    if ([userDefaults objectForKey:@"activeTime"] == nil) {
        [userDefaults setObject:@"0" forKey:@"activeTime"];
    } else {
        
    }
    
    routes = [NSMutableArray array];
    self.favouriteRoutes = [NSMutableArray array];
    FavouriteRoute *fr = [Helper.userFavourites objectAtIndex:self.orginFavouriteRouteIndex];
    
    [self.favouriteRoutes addObject:fr];
    
    [self refreshRoutes :Helper.nowTime :self.favouriteRoutes];
}

- (void) setActiveFavouriteRoute :(NSInteger)originIndex :(NSInteger)destIndex {
    self.orginFavouriteRouteIndex = originIndex;
    self.destFavouriteRouteIndex = destIndex;
}

- (void)refreshRoutes :(NSString*)time :(NSArray*)favouriteRoutes
{
    [routes removeAllObjects];
    
    FavouriteRoute *frOrigin = [Helper.userFavourites objectAtIndex:[Helper activeOriginPosition]];
    FavouriteRoute *frDest = [Helper.userFavourites objectAtIndex:[Helper activeDestPosition]];
    
    if ([frOrigin.destinationStation.siteId isEqualToString:frDest.destinationStation.siteId]) {
        return;
    }
    
    NSURL *url = [NSURL URLWithString:
                  [NSString stringWithFormat:@"https://api.trafiklab.se/sl/reseplanerare.xml?key=%@&S=%@&Z=%@&time=%@",
                   Secrets.SL_API_KEY,
                   frOrigin.destinationStation.siteId,
                   frDest.destinationStation.siteId,
                   time]
                  ];

    NSData *data = [NSData dataWithContentsOfURL:url];
    
    NSError *error;
    
    TBXML *t = [TBXML newTBXMLWithXMLData:data error:&error];

    TBXMLElement *trip = [TBXML childElementNamed:@"Trip" parentElement:t.rootXMLElement];
    
    int routeIndex = 0;
    
    do {
        TBXMLElement *summary               = [TBXML childElementNamed:@"Summary" parentElement:trip];
        TBXMLElement *summaryOrigin         = [TBXML childElementNamed:@"Origin" parentElement:summary];
        TBXMLElement *summaryDestination    = [TBXML childElementNamed:@"Destination" parentElement:summary];
        
        Station *summaryOriginStation       = [[Station alloc] init];
        summaryOriginStation.name           = [TBXML textForElement:summaryOrigin];
        
        Station *summaryDestinationStation  = [[Station alloc] init];
        summaryDestinationStation.name      = [TBXML textForElement:summaryDestination];
        
        TBXMLElement *subTrip               = [TBXML childElementNamed:@"SubTrip" parentElement:trip];

        Route *slRoute = [[Route alloc] init];
        
        [slRoute setStations :summaryOriginStation :summaryDestinationStation];
        
        slRoute.line = 1; // red line
        
        int subRouteIndex = 0;
        
        do {
            if (subTrip != nil) {
                TBXMLElement *depDate = [TBXML childElementNamed:@"DepartureDate" parentElement:subTrip];
                TBXMLElement *depTime = [TBXML childElementNamed:@"DepartureTime" parentElement:subTrip];
                TBXMLElement *arrDate = [TBXML childElementNamed:@"ArrivalDate" parentElement:subTrip];
                TBXMLElement *arrTime = [TBXML childElementNamed:@"ArrivalTime" parentElement:subTrip];
                TBXMLElement *origin = [TBXML childElementNamed:@"Origin" parentElement:subTrip];
                TBXMLElement *destination = [TBXML childElementNamed:@"Destination" parentElement:subTrip];
                
                TBXMLElement *transport = [TBXML childElementNamed:@"Transport" parentElement:subTrip];
                TBXMLElement *transportType = [TBXML childElementNamed:@"Type" parentElement:transport];
                TBXMLElement *transportName = [TBXML childElementNamed:@"Name" parentElement:transport];
                TBXMLElement *transportLine = [TBXML childElementNamed:@"Line" parentElement:transport];
                TBXMLElement *transportTowards = [TBXML childElementNamed:@"Towards" parentElement:transport];
                
                Station *originStation = [[Station alloc] init];
                originStation.name = [TBXML textForElement:origin];
                
                Station *destStation = [[Station alloc] init];
                destStation.name = [TBXML textForElement:destination];
                
                NSDateFormatter *df = [[NSDateFormatter alloc] init];
                [df setDateFormat:@"dd.MM.yy HH:mm"];
                
                NSString *depDateStr = [NSString stringWithFormat:@"%@ %@", [TBXML textForElement:depDate], [TBXML textForElement:depTime]];
                NSString *arrDateStr = [NSString stringWithFormat:@"%@ %@", [TBXML textForElement:arrDate], [TBXML textForElement:arrTime]];
                
                NSDate *originDate = [df dateFromString:depDateStr];
                NSDate *destDate = [df dateFromString:arrDateStr];
                
                Route *sr = [[Route alloc] init];
                [sr setStations :originStation :destStation];
                [sr setDates:originDate :destDate];
                sr.transportType = [TBXML textForElement:transportType];
                sr.transportName = [TBXML textForElement:transportName];
                sr.transportLine = [TBXML textForElement:transportLine];
                sr.transportTowards = [TBXML textForElement:transportTowards];
                
                sr.line = 1; // red line
                
                NSInteger ri = [routes count] - 1;
                
                if (routeIndex > 0 && subRouteIndex == 0) {
                    Route *rootRoute = [routes objectAtIndex:ri];
                    Route *rootSubRoute = [rootRoute.subRoutes objectAtIndex:subRouteIndex];
                    [rootSubRoute.originDatesFuture addObject:originDate];
                    [rootSubRoute.destDatesFututes addObject:destDate];
                    [rootRoute.subRoutes replaceObjectAtIndex:subRouteIndex withObject:rootSubRoute];
                    [routes replaceObjectAtIndex:ri withObject:rootRoute];
                }
                
                [slRoute.subRoutes addObject:sr];
                subRouteIndex++;
            }
        } while ((subTrip = subTrip->nextSibling));

        if (routeIndex > 0) {
            NSInteger ri = [routes count] - 1;
            if ([Route sameRoutes:[routes objectAtIndex: ri] :slRoute]) {
                continue;
            }
        }
                 
        [routes addObject:slRoute];
        routeIndex++;
    } while ((trip = trip->nextSibling));
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [routes count] + 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0 && indexPath.section >= 1) {
        return [TableRouteViewCell calculateRowHeight:[routes objectAtIndex:indexPath.section - 1]];
    } else
    {
        return [super tableView:tableView heightForRowAtIndexPath:indexPath];
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    
    if (indexPath.row >= 1 || indexPath.section == 0) {
        
        NSString *ident = @"ToMetroCell";
        
        if (indexPath.section == 0) {
            ident = @"PositionCell";
            
            
        }
        else if (indexPath.row == 1) {
            ident = @"ToTimeTableCell";
        }
        
        cell = [tableView  dequeueReusableCellWithIdentifier:ident forIndexPath:indexPath];
        
        if (indexPath.section == 0 && indexPath.row == 0) {
            FavouriteRoute *frOrigin = [Helper.userFavourites objectAtIndex:self.orginFavouriteRouteIndex];
            FavouriteRoute *frDest = [Helper.userFavourites objectAtIndex:self.destFavouriteRouteIndex];
            
            [(UILabel*)[cell viewWithTag:3] setText:[NSString stringWithFormat:@"%@ › %@", frOrigin.name, frDest.name]];
        }
        
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ident];
        }
    }
    
    if (indexPath.row == 0 && indexPath.section > 0)
    {
        if (index)
            cell = [tableView  dequeueReusableCellWithIdentifier:@"RouteCell" forIndexPath:indexPath];
    
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"RouteCell"];
        }
        
        Route *r = [routes objectAtIndex:indexPath.section - 1];
    
        TableRouteViewCell *tableRouteViewCell = (TableRouteViewCell*)[self.view viewWithTag:5];
        tableRouteViewCell.route = r;
        CGRect f = tableRouteViewCell.frame;
        NSInteger h = [TableRouteViewCell calculateRowHeight:r];
        f.size.width = 320;
        f.size.height = h;
        [tableRouteViewCell setFrame:f];
        [tableRouteViewCell setNeedsDisplay];
    //   [tableRouteViewCell setNeedsDisplay];
    }

    NSLog(@"cellForRow...");
    return cell;
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"Min Position";
    }
    
    Route *r = [routes objectAtIndex:section - 1];
                
    return [NSString stringWithFormat:@"Jobb (%@ › %@)", r.originStation.name, r.destinationStation.name];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
- (IBAction)RefreshClick:(id)sender {
    [self refreshRoutes :Helper.nowTime :self.favouriteRoutes];
    [self.tableView reloadData];
    [self.tableView reloadInputViews];
    
    [self viewDidAppear:NO];
    [self viewWillAppear:NO];
}
@end
