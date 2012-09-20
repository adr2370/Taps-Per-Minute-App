//
//  TPMMenu.h
//  TPM
//
//  Created by Alexander Ramirez on 3/25/11.
//  Copyright 2011 Troy High School. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TPMMainMenu;
@class TPMViewController;
@class TapsPerMinuteViewController;

@interface TPMMenu : UIViewController {
	IBOutlet UIImageView *Background;
	IBOutlet UIImageView *Reset;
	IBOutlet UIImageView *ToMenu;
	IBOutlet UILabel *HighScoreTitle;
	IBOutlet UILabel *HighScoreName;
	IBOutlet UILabel *HighScoreScore;
	IBOutlet UILabel *GoalsTitle;
	IBOutlet UILabel *Goal1;
	IBOutlet UILabel *Goal2;
	IBOutlet UILabel *Goal3;
	IBOutlet UILabel *ResetGameSlideLabel;
	IBOutlet UILabel *ReturnToMenuLabel;
	IBOutlet UILabel *TapsCount;
	IBOutlet UILabel *TPM;
	TapsPerMinuteViewController *delegate;
}
-(void) setHighScore;
-(void) setScore:(NSInteger)score;
@property (retain) TapsPerMinuteViewController *delegate;
@property(nonatomic,retain) IBOutlet UIImageView *Background;
@property(nonatomic,retain) IBOutlet UIImageView *Reset;
@property(nonatomic,retain) IBOutlet UIImageView *ToMenu;
@property(nonatomic,retain) IBOutlet UILabel *HighScoreTitle;
@property(nonatomic,retain) IBOutlet UILabel *HighScoreName;
@property(nonatomic,retain) IBOutlet UILabel *HighScoreScore;
@property(nonatomic,retain) IBOutlet UILabel *GoalsTitle;
@property(nonatomic,retain) IBOutlet UILabel *Goal1;
@property(nonatomic,retain) IBOutlet UILabel *Goal2;
@property(nonatomic,retain) IBOutlet UILabel *Goal3;
@property(nonatomic,retain) IBOutlet UILabel *ResetGameSlideLabel;
@property(nonatomic,retain) IBOutlet UILabel *ReturnToMenuLabel;
@property(nonatomic,retain) IBOutlet UILabel *TapsCount;
@property(nonatomic,retain) IBOutlet UILabel *TPM;

@end
