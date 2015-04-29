//
//  BAHViewController.m
//  BAHCoordinationLocker
//
//  Created by BHughes3388 on 04/18/2015.
//  Copyright (c) 2014 BHughes3388. All rights reserved.
//

#import "BAHViewController.h"

@interface BAHViewController ()

@end

@implementation BAHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *title = [[UILabel alloc]init];
    [title setText:@"Main ViewController"];
    [title setFont:[UIFont systemFontOfSize:30.0f]];
    [title sizeToFit];
    [title setCenter:CGPointMake(self.view.center.x, self.view.center.y - 100)];
    [title setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin];
    [self.view addSubview:title];
    
    
    [BAHCoordinationLockerViewController setActivateHour:[NSNumber numberWithInt:12]];
    [BAHCoordinationLockerViewController setDeActivateHour:[NSNumber numberWithInt:24]];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
