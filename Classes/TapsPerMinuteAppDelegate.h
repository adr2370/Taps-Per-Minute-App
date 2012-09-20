//
//  TapsPerMinuteAppDelegate.h
//  TapsPerMinute
//
//  Created by Alexander Ramirez on 3/27/11.
//  Copyright 2011 Troy High School. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TapsPerMinuteViewController;

@interface TapsPerMinuteAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    TapsPerMinuteViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet TapsPerMinuteViewController *viewController;

@end

