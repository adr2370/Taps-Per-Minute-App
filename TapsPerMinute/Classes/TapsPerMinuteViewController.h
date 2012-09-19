//
//  TapsPerMinuteViewController.h
//  TapsPerMinute
//
//  Created by Alexander Ramirez on 3/27/11.
//  Copyright 2011 Troy High School. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TPMMenu;
@class TPMViewController;
@interface TapsPerMinuteViewController : UIViewController {
	//TPMMenu menu;
	//TPMViewController game;
}
- (void) setHighScore;
- (void) setScore:(NSInteger)score;
- (IBAction)switchViews:(id)sender;
//@property (nonatomic, retain) TPMMenu menu;
//@property (nonatomic, retain) TPMViewController game;
@end

