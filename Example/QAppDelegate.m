// Copyright 2012 Todd Reed
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#import "QAppDelegate.h"
#import "QTouchposeApplication.h"


@implementation QAppDelegate

#pragma mark UIApplicationDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    QTouchposeApplication *touchposeApplication = (QTouchposeApplication *)application;
    touchposeApplication.alwaysShowTouches = YES;
    
    return YES;
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

@end
