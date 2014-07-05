//
//  NewFavouriteTableViewController.m
//  SL4Ever
//
//  Created by Rikard on 29/06/14.
//  Copyright (c) 2014 Rikard. All rights reserved.
//

#import "NewFavouriteTableViewController.h"
#import "Helper.h"
#import "Station.h"

@interface NewFavouriteTableViewController ()

@end

@implementation NewFavouriteTableViewController

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
   // self.activeStation = 3;
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
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    
    return 1;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSString *siteId = [[Station.loadStations objectAtIndex:self.activeStation] siteId];
    UITextView* tv = [[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] ] viewWithTag:7];
    NSString* name = tv.text;
    
    FavouriteRoute *fr = [[FavouriteRoute alloc] init];
    fr.destinationStation = [Station findStation:siteId];
    fr.name = name;
    [Helper addUserFavourite:fr];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    
    
    
    if (indexPath.section == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"PositionCell" forIndexPath:indexPath];
        [cell setAccessoryType:UITableViewCellAccessoryNone];
        //[(UILabel*)[cell viewWithTag:3] setText:[Helper.positions objectAtIndex:indexPath.row]];
        
    }
    else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"StationCell" forIndexPath:indexPath];
        Station *station = [self.stations objectAtIndex:self.activeStation];
        [(UILabel*)[cell viewWithTag:3] setText:station.name];
    }
    
    return cell;
}
- (void) setActiveStationIndex :(NSInteger)stationIndex {
    self.activeStation = stationIndex;
    [self.tableView reloadData];
    return;
}
- (NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"Plats";
    }
    
    if (section == 1) {
        return @"Station";
    }
    
    return @"";
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
 

}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
