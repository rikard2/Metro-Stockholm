//
//  MainViewController.m
//  SL4Ever
//
//  Created by Rikard on 22/06/14.
//  Copyright (c) 2014 Rikard. All rights reserved.
//

#import "MainViewController.h"
#import "RouteView.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     RouteView *rv = [[[NSBundle mainBundle] loadNibNamed:@"RouteView" owner:self options:nil] objectAtIndex:0];
    
    [scrollView addSubview:rv];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
