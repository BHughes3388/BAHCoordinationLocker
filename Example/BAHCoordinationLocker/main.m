//
//  main.m
//  BAHCoordinationLocker
//
//  Created by BHughes3388 on 04/18/2015.
//  Copyright (c) 2014 BHughes3388. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QAppDelegate.h"
#import "QTouchposeApplication.h"
#import "BAHAppDelegate.h"

int main(int argc, char * argv[])
{
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([BAHAppDelegate class]));
        //return UIApplicationMain(argc, argv, NSStringFromClass([QTouchposeApplication class]), NSStringFromClass([QAppDelegate class]));
    }
}
