//
//  TPMViewController.h
//  TPM
//
//  Created by Alexander Ramirez on 1/2/11.
//  Copyright 2011 Troy High School. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TPMMenu;
@class TPMMainMenu;
@class TapsPerMinuteViewController;

@interface TPMViewController : UIViewController {	
	IBOutlet UIImageView *background;
	IBOutlet UIImageView *start;
	IBOutlet UILabel *time;
	IBOutlet UILabel *slideToBegin;
	UIImageView *imageView;
	TapsPerMinuteViewController *delegate;
}
@property (retain) TapsPerMinuteViewController *delegate;
@property(nonatomic,retain) IBOutlet UIImageView *background;
@property(nonatomic,retain) IBOutlet UIImageView *start;
@property(nonatomic,retain) IBOutlet UILabel *time;
@property(nonatomic,retain) IBOutlet UILabel *slideToBegin;
@end

