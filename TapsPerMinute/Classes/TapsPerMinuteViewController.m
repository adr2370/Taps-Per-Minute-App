//
//  TapsPerMinuteViewController.m
//  TapsPerMinute
//
//  Created by Alexander Ramirez on 3/27/11.
//  Copyright 2011 Troy High School. All rights reserved.
//

#import "TapsPerMinuteViewController.h"
#import "TPMMenu.h"
#import "TPMViewController.h"

@implementation TapsPerMinuteViewController
TPMMenu *menu;
TPMViewController *game;

- (void)setHighScore {
    [menu setHighScore];
	return;
}

- (void)setScore:(NSInteger)score {
    [menu setScore:score];
	return;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	if(self.view==menu.view)
	{
		[menu touchesEnded:touches withEvent:event];
	}
	else 
	{
		[game touchesEnded:touches withEvent:event];
	}
	
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	if(self.view==menu.view)
	{
		[menu touchesMoved:touches withEvent:event];
	}
	else 
	{
		[game touchesMoved:touches withEvent:event];
	}
	
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	if(self.view==menu.view)
	{
		[menu touchesBegan:touches withEvent:event];
	}
	else 
	{
		[game touchesBegan:touches withEvent:event];
	}
}

- (IBAction)switchViews:(id)sender {
    if(self.view==game.view)
    {
		menu=[[TPMMenu alloc] init];
		menu.delegate=self;
        self.view=menu.view;
		CGAffineTransform transform = CGAffineTransformMakeRotation(3.14159/2);
		self.view.transform = transform;
		CGRect contentRect = CGRectMake(0, 0, 480, 320);
		self.view.bounds = contentRect;
	}
	else
	{
		game=[[TPMViewController alloc] init];
		game.delegate=self;
		[game reload];
		self.view=game.view;
		CGAffineTransform transform = CGAffineTransformMakeRotation(3.14159/2);
		self.view.transform = transform;
		CGRect contentRect = CGRectMake(0, 0, 480, 320);
		self.view.bounds = contentRect;
	}

}

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	menu=[[TPMMenu alloc] init];
	game=[[TPMViewController alloc] init];
	game.delegate=self;
	menu.delegate=self;
	[self.view insertSubview:game.view atIndex:0];
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
	menu=[[TPMMenu alloc] init];
	game=[[TPMViewController alloc] init];
	menu.delegate=self;
	game.delegate=self;
	self.view=game.view;
}


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
