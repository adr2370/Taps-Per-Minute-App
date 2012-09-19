//
//  TPMMenu.m
//  TPM
//
//  Created by Alexander Ramirez on 3/25/11.
//  Copyright 2011 Troy High School. All rights reserved.
//

#import "TPMViewController.h"
#import "TPMMenu.h"

@class TPMViewController;
@implementation TPMMenu
@synthesize delegate;
@synthesize Background,Reset,ToMenu,HighScoreTitle,HighScoreName,HighScoreScore,GoalsTitle,Goal1,Goal2,Goal3;
@synthesize ResetGameSlideLabel,ReturnToMenuLabel,TapsCount,TPM;
NSInteger HighScore=0;
NSInteger GamesPlayed=0;
NSInteger resety=0;
NSInteger resetx=0;
NSInteger tomenuy=0;
NSInteger tomenux=0;
UIImageView *beingmoved;

- (void)setHighScore {
	NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
	if(HighScore>=[prefs integerForKey:@"HighScore"])
	{
		[prefs setInteger:HighScore forKey:@"HighScore"];
	}
	[prefs synchronize];
	return;
}

- (void)setScore:(NSInteger)score {
    TapsCount.text = [NSString stringWithFormat:@"%d Taps",score];
	if(score==1)
	{
		TapsCount.text = [NSString stringWithFormat:@"%d Tap",score];
	}
	TPM.text = [NSString stringWithFormat:@"%d TPM",score*6];
	if(score>=HighScore)
	{
		HighScore=score;
	}
	HighScoreScore.text = [NSString stringWithFormat:@"%d",HighScore];
	GamesPlayed++;
	NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
	[prefs setInteger:GamesPlayed forKey:@"GamesPlayed"];
	[prefs synchronize];
	Goal1.text = [NSString stringWithFormat:@"%d",GamesPlayed];
	return;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	NSArray *allTouches = [touches allObjects]; 
    int count = [allTouches count]; 
    if (count == 1)
	{
		[UIView beginAnimations:@"MoveBack" context:nil];
		[UIView setAnimationDelegate:Reset];
		[UIView setAnimationDuration:(Reset.center.x-resetx)/(390-79)*0.5];
		[UIView setAnimationBeginsFromCurrentState:YES];
		CGPoint center=Reset.center;
		center.y=resety;
		center.x=resetx;
		Reset.center=center;
		[UIView commitAnimations];
		[UIView beginAnimations:@"MoveBack" context:nil];
		[UIView setAnimationDelegate:ToMenu];
		[UIView setAnimationDuration:(ToMenu.center.x-tomenux)/(390-79)*0.5];
		[UIView setAnimationBeginsFromCurrentState:YES];
		center=ToMenu.center;
		center.y=tomenuy;
		center.x=tomenux;
		ToMenu.center=center;
		[UIView commitAnimations];
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	NSArray *allTouches = [touches allObjects]; 
    int count = [allTouches count]; 
    if (count == 1) 
	{
        if (beingmoved==Reset&&CGRectContainsPoint([Reset frame], [[allTouches objectAtIndex:0] locationInView:self.view]))
		{
			UITouch *touch = [allTouches objectAtIndex:0];
			CGPoint center=[touch locationInView:self.view];
			center.y=Reset.center.y;
			if(center.x>400)
			{
				center.x=400;
			}
			if(center.x<79)
			{
				center.x=79;
			}
			Reset.center = center;
			if(Reset.center.x>=390)
			{
				[self.delegate switchViews:self];
			}
        }
		else if (beingmoved==ToMenu&&CGRectContainsPoint([ToMenu frame], [[allTouches objectAtIndex:0] locationInView:self.view]))
		{
			UITouch *touch = [allTouches objectAtIndex:0];
			CGPoint center=[touch locationInView:self.view];
			center.y=ToMenu.center.y;
			if(center.x>400)
			{
				center.x=400;
			}
			if(center.x<79)
			{
				center.x=79;
			}
			ToMenu.center = center;
			if(Reset.center.x>=390)
			{
				[self.delegate switchViews:self];
			}
        }
		else {
			[UIView beginAnimations:@"MoveBack" context:nil];
			[UIView setAnimationDelegate:Reset];
			[UIView setAnimationDuration:(Reset.center.x-resetx)/(390-79)*0.5];
			[UIView setAnimationBeginsFromCurrentState:YES];
			CGPoint center=Reset.center;
			center.y=resety;
			center.x=resetx;
			Reset.center=center;
			[UIView commitAnimations];
			[UIView beginAnimations:@"MoveBack" context:nil];
			[UIView setAnimationDelegate:ToMenu];
			[UIView setAnimationDuration:(ToMenu.center.x-tomenux)/(390-79)*0.5];
			[UIView setAnimationBeginsFromCurrentState:YES];
			center=ToMenu.center;
			center.y=tomenuy;
			center.x=tomenux;
			ToMenu.center=center;
			[UIView commitAnimations];
		}
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	NSArray *allTouches = [touches allObjects]; 
    int count = [allTouches count]; 
    if (count == 1)
	{
        if (CGRectContainsPoint([Reset frame], [[allTouches objectAtIndex:0] locationInView:self.view]))
		{
			beingmoved=Reset;
        }
		else if (CGRectContainsPoint([ToMenu frame], [[allTouches objectAtIndex:0] locationInView:self.view]))
		{
			beingmoved=ToMenu;
        }
    }
}

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*- (id)initWithNib { // Load the view nib
    if (self = [super initWithNibName:@"TPMMenu" bundle:nil]) {
        // do ivar initialization here, if needed
    }
    return self;
}*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
	HighScore  = [prefs integerForKey:@"HighScore"];
	GamesPlayed  = [prefs integerForKey:@"GamesPlayed"];
	resetx=Reset.center.x;
	resety=Reset.center.y;
	tomenux=ToMenu.center.x;
	tomenuy=ToMenu.center.y;
}


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    self.view = nil;
}

- (void)dealloc {
    [super dealloc];
	[Background release];
	[Reset release];
	[ToMenu release];
	[HighScoreTitle release];
	[HighScoreName release];
	[HighScoreScore release];
	[GoalsTitle release];
	[Goal1 release];
	[Goal2 release];
	[Goal3 release];
	[ResetGameSlideLabel release];
	[ReturnToMenuLabel release];
	[TapsCount release];
	[TPM release];
}


@end
