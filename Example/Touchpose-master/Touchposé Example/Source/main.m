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

#import <UIKit/UIKit.h>

#import "QAppDelegate.h"
#import "QTouchposeApplication.h"

int main(int argc, char *argv[])
{
    @autoreleasepool
    {
        int result;
#if !(AppStoreRelease)
        // Use the Touch-based UIApplication
        result = UIApplicationMain(argc, argv,
                                   NSStringFromClass([QTouchposeApplication class]),
                                   NSStringFromClass([QAppDelegate class]));
#else
        // Use the default UIApplication (don't use touches!)
        result = UIApplicationMain(argc, argv, nil,
                                   NSStringFromClass([QAppDelegate class]));
#endif
        
    }
}
