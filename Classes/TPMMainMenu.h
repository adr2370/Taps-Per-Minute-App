//
//  TPMMainMenu.h
//  TapsPerMinute
//
//  Created by Alexander Ramirez on 4/1/11.
//  Copyright 2011 Troy High School. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TPMMenu;
@class TPMViewController;
@class TapsPerMinuteViewController;

@interface TPMMainMenu : UIViewController {
	IBOutlet UIImageView *background;
	IBOutlet UILabel *justTapTitle;
	IBOutlet UILabel *justTapName;
	IBOutlet UILabel *justTapScore;
	IBOutlet UILabel *justTapGoals;
	IBOutlet UILabel *justTapGoal1;
	IBOutlet UILabel *justTapGoal2;
	IBOutlet UILabel *justTapGoal3;
	IBOutlet UILabel *settings;
	IBOutlet UILabel *play;
	IBOutlet UILabel *TPM;
}
@property(nonatomic,retain) IBOutlet UIImageView *background;
@property(nonatomic,retain) IBOutlet UILabel *justTapTitle;
@property(nonatomic,retain) IBOutlet UILabel *justTapName;
@property(nonatomic,retain) IBOutlet UILabel *justTapScore;
@property(nonatomic,retain) IBOutlet UILabel *justTapGoals;
@property(nonatomic,retain) IBOutlet UILabel *justTapGoal1;
@property(nonatomic,retain) IBOutlet UILabel *justTapGoal2;
@property(nonatomic,retain) IBOutlet UILabel *justTapGoal3;
@property(nonatomic,retain) IBOutlet UILabel *settings;
@property(nonatomic,retain) IBOutlet UILabel *play;
@property(nonatomic,retain) IBOutlet UILabel *TPM;

@end
