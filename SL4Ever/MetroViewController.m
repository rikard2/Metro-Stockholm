//
//  MetroViewController.m
//  SL4Ever
//
//  Created by Rikard on 23/06/14.
//  Copyright (c) 2014 Rikard. All rights reserved.
//

#import "MetroViewController.h"

@interface MetroViewController ()

@end

@implementation MetroViewController

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
    
    [scroller setScrollEnabled:TRUE];
    
    // Hur stor area ska scrollas (bör vara samma storlek som innehållet...)
    [scroller setContentSize:CGSizeMake(320, 2000)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
