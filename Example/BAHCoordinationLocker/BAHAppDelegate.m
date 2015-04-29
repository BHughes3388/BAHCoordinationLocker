//
//  BAHAppDelegate.m
//  BAHCoordinationLocker
//
//  Created by CocoaPods on 04/18/2015.
//  Copyright (c) 2014 BHughes3388. All rights reserved.
//

#import "BAHAppDelegate.h"

@implementation BAHAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
   
    BAHCoordinationLockerViewController *lockView = [[BAHCoordinationLockerViewController alloc]init];
    [lockView setTapViewSize:85.0f];
    [lockView setBackgroundColor:[UIColor colorWithRed:105/255.0f green:205/255.0f blue:255/255.0f alpha:1.0f]];
    [lockView setBackGroundImage:[UIImage imageNamed:@"wallpaper.jpg"]];
    [lockView setFrostedViewBackGroundColor:[UIColor colorWithRed:0.72f green:0.72f blue:0.72f alpha:0.75f]];
    [lockView setTopTapViewTintColor:[UIColor colorWithRed:0.8f green:0.3f blue:0.2f alpha:0.5f]];
    [lockView setTopTapViewBorderTintColor:[UIColor whiteColor].CGColor];
    [lockView setBottomTapViewTintColor:[UIColor colorWithRed:0.2f green:0.3f blue:0.8f alpha:0.75f]];
    [lockView setBottomTapViewBorderTintColor:[UIColor whiteColor].CGColor];
    [lockView setSuccessLabelText:@"You're In!"];
    [lockView setSuccessLabelTextColor:[UIColor colorWithWhite:1.0f alpha:0.85f]];
    [lockView setTollerance:0.1];
    
    [lockView checkSettingsForCoordinationLockerOnView:self.window.rootViewController];

    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
