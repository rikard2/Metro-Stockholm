//
//  PositionTableViewController.m
//  SL4Ever
//
//  Created by Rikard on 28/06/14.
//  Copyright (c) 2014 Rikard. All rights reserved.
//

#import "PositionTableViewController.h"
#import "Helper.h"
#import "RouteTableViewController.h"
@interface PositionTableViewController ()

@end

@implementation PositionTableViewController

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
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0 || section == 1) {
        return [Helper.userFavourites count];
    }
    
    if (section == 2) {
        return [Helper.times count];
    }
    
    return 0;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    RouteTableViewController *rtvc = [segue destinationViewController];
    
    [rtvc setActiveFavouriteRoute:Helper.activeOriginPosition :Helper.activeDestPosition];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SettingCell" forIndexPath:indexPath];
    
    [cell setAccessoryType:UITableViewCellAccessoryNone];
    
    if (indexPath.section == 0) {
        [(UILabel*)[cell viewWithTag:3] setText:[[Helper.userFavourites objectAtIndex:indexPath.row] name]];
        if (indexPath.row == Helper.activeOriginPosition) {
            [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
        }
    }
    
    if (indexPath.section == 1) {
        [(UILabel*)[cell viewWithTag:3] setText:[[Helper.userFavourites objectAtIndex:indexPath.row] name]];
        if (indexPath.row == Helper.activeDestPosition) {
            [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
        }
    }
    
    if (indexPath.section == 2) {
        [(UILabel*)[cell viewWithTag:3] setText:[Helper.times objectAtIndex:indexPath.row]];
        
        if (indexPath.row == Helper.activeTime) {
            [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
        }
    }
    
    return cell;
}

- (NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"Nuvarande plats";
    }
    
    if (section == 1) {
        return @"Destination";
    }
    
    if (section == 2) {
        return @"Avgång";
    }
    
    return @"???";
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (indexPath.section == 0) {
        for (int i = 0; i < Helper.userFavourites.count; i++) {
            UITableViewCell *cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
            if (i == indexPath.row) {
                [Helper setActiveOriginPosition :i];
                [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
                
                continue;
            }
            
            [cell setAccessoryType:UITableViewCellAccessoryNone];
        }
    }
    
    if (indexPath.section == 1) {
        for (int i = 0; i < Helper.userFavourites.count; i++) {
            UITableViewCell *cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:1]];
            if (i == indexPath.row) {
                [Helper setActiveDestPosition :i];
                [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
                
                continue;
            }
            
            [cell setAccessoryType:UITableViewCellAccessoryNone];
        }
    }
    
    if (indexPath.section == 2) {
        for (int i = 0; i < Helper.times.count; i++) {
            UITableViewCell *cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:2]];
            if (i == indexPath.row) {
                [Helper setActiveTime :i];
                [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
                
                continue;
            }
            
            [cell setAccessoryType:UITableViewCellAccessoryNone];
        }
    }
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
