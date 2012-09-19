//
//  TPMViewController.m
//  TPM
//
//  Created by Alexander Ramirez on 1/2/11.
//  Copyright 2011 Troy High School. All rights reserved.
//

#import "TPMViewController.h"
#import "TPMMenu.h"

@class TPMMenu;
@implementation TPMViewController
@synthesize background,time,start,slideToBegin;
@synthesize delegate;
NSInteger counter=0;
NSInteger timeRemaining=1000;
NSInteger began=0;
NSInteger startx=0;
NSInteger starty=0;
CFTimeInterval startTime=0;

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	NSArray *allTouches = [touches allObjects];
    int count = [allTouches count]; 
    if (count == 1) 
	{
		if(timeRemaining>0)
		{
			if(timeRemaining<1000)
			{
				return;
			}
		}
        if (CGRectContainsPoint([start frame], [[allTouches objectAtIndex:0] locationInView:self.view]))
		{
			[UIView beginAnimations:@"MoveBack" context:nil];
			[UIView setAnimationDelegate:start];
			[UIView setAnimationDuration:(start.center.x-startx)/(380-100)*0.5];
			[UIView setAnimationBeginsFromCurrentState:YES];
			CGPoint center=start.center;
			center.y=starty;
			center.x=startx;
			start.center=center;
			[UIView commitAnimations];			
        }
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	NSArray *allTouches = [touches allObjects];
    int count = [allTouches count]; 
    if (count == 1) 
	{
		if(timeRemaining>0)
		{
			if(timeRemaining<1000)
			{
				return;
			}
		}
        if (CGRectContainsPoint([start frame], [[allTouches objectAtIndex:0] locationInView:self.view]))
		{
			UITouch *touch = [allTouches objectAtIndex:0];
			CGPoint center=[touch locationInView:self.view];
			center.y=start.center.y;
			if(center.x>380)
			{
				center.x=380;
			}
			if(center.x<100)
			{
				center.x=100;
			}
			start.center = center;
			if(start.center.x==380)
			{
				began=1;
				start.hidden=YES;
				slideToBegin.hidden=YES;
				CGPoint center=[touch locationInView:self.view];
				center.y=starty;
				center.x=startx;
				start.center=center;
				startTime = CFAbsoluteTimeGetCurrent();
			}
        }
		else {
			[UIView beginAnimations:@"MoveBack" context:nil];
			[UIView setAnimationDelegate:start];
			[UIView setAnimationDuration:(start.center.x-startx)/(380-100)*0.5];
			[UIView setAnimationBeginsFromCurrentState:YES];
			CGPoint center=start.center;
			center.y=starty;
			center.x=startx;
			start.center=center;
			[UIView commitAnimations];	
		}

    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	if(timeRemaining>0&&began==1)
	{
		[super touchesBegan:touches withEvent:event];
		NSArray *allTouches = [touches allObjects];
		int count = [allTouches count];
		for(int i=0;i<count;i++)
		{
			background.backgroundColor = [[UIColor alloc] initWithRed:1/*(arc4random()%225+30)/255.0f*/ green:1/*(arc4random()%225+30)/255.0f*/ blue:1/*(arc4random()%225+30)/255.0f*/ alpha:1.0];
			UITouch *touch = [allTouches objectAtIndex:i];
			imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
			imageView.center = [touch locationInView:self.view];
			imageView.backgroundColor = [[UIColor alloc] initWithRed:0/*arc4random()%200/255.0f*/ green:0/*arc4random()%200/255.0f*/ blue:0/*arc4random()%200/255.0f*/ alpha:0.7];
			[self.view addSubview:imageView];
			[UIView beginAnimations:@"MoveAndStrech" context:nil];
			[UIView setAnimationDelegate:imageView];
			[UIView setAnimationDidStopSelector:@selector(removeFromSuperview)];
			[UIView setAnimationDuration:1.0];
			[UIView setAnimationBeginsFromCurrentState:YES];
			int x=480;
			int y=320;
			if(imageView.center.x>background.center.x)
			{
				x=-25;
			}
			if(imageView.center.y>background.center.y)
			{
				y=-25;
			}
			imageView.frame = CGRectMake(x, y, 25, 25);
			[UIView commitAnimations];
		}
		counter+=count;
	}
}

- (void) gameLoop {
	if(began==1)
	{
		CFTimeInterval now = CFAbsoluteTimeGetCurrent();
		float timeDifference = now - startTime;
		timeDifference=10-timeDifference;
		timeRemaining=100*timeDifference;
		int first=timeRemaining/100;
		int second=timeRemaining/10%10;
		int third=timeRemaining%10;
		time.text = [NSString stringWithFormat:@"%d.%d%d",first,second,third];
		if(timeRemaining<=0)
		{
			time.hidden=YES;
			start.hidden=YES;
			slideToBegin.hidden=YES;
			background.hidden=YES;
			[self.delegate switchViews:self];
			[self.delegate setScore:counter];
			began=0;
		}
	}
}

- (void)reload {
	CGPoint center=background.center;
	center.y=center.y-50;;
	time.center = center;
	background.hidden=NO;
	timeRemaining=1000;
	time.hidden=NO;
	startx=start.center.x;
	starty=start.center.y;
	int first=timeRemaining/100;
	int second=timeRemaining/10%10;
	int third=timeRemaining%10;
	time.text = [NSString stringWithFormat:@"%d.%d%d",first,second,third];
	start.hidden=NO;
	slideToBegin.hidden=NO;
	counter=0;
	began=0;
	[NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(gameLoop) userInfo:nil repeats:YES];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	CGPoint center=background.center;
	center.y=center.y-50;;
	time.center = center;
	background.hidden=NO;
	timeRemaining=1000;
	time.hidden=NO;
	startx=start.center.x;
	starty=start.center.y;
	int first=timeRemaining/100;
	int second=timeRemaining/10%10;
	int third=timeRemaining%10;
	time.text = [NSString stringWithFormat:@"%d.%d%d",first,second,third];
	start.hidden=NO;
	slideToBegin.hidden=NO;
	counter=0;
	began=0;
	[NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(gameLoop) userInfo:nil repeats:YES];
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
	self.view = nil;
}

- (void)dealloc {
    [super dealloc];
	[background release];
	[time release];
	[start release];
}

@end