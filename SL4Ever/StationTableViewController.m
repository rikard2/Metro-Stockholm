//
//  StationTableViewController.m
//  SL4Ever
//
//  Created by Rikard on 29/06/14.
//  Copyright (c) 2014 Rikard. All rights reserved.
//

#import "StationTableViewController.h"
#import "Station.h"
#import "NewFavouriteTableViewController.h"

@interface StationTableViewController ()

@end

@implementation StationTableViewController

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
    
    self.stations = [Station loadStations];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.stations count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StationCell"  forIndexPath:indexPath];
    
    Station* station = [self.stations objectAtIndex:indexPath.row];
    
    [(UILabel*)[cell viewWithTag:3] setText:station.name];
    
    if (indexPath.row == 3) {
        [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
    } else {
        [cell setAccessoryType:UITableViewCellAccessoryNone];
    }

    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedStationIndex = indexPath.row;
    for (int i = 0; i < self.stations.count; i++) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        if (i == indexPath.row) {
            [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
            
            continue;
        }
        
        
        [cell setAccessoryType:UITableViewCellAccessoryNone];
    }
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [((NewFavouriteTableViewController*)segue.destinationViewController) setActiveStationIndex:self.selectedStationIndex];
}

@end
