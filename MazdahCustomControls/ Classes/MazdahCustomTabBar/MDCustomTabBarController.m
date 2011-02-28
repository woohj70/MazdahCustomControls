//
//  MDCustomTabBarController.m
//  MazdahCustomControls
//
//  Created by HYOUNG JUN WOO on 11. 2. 23..
//  Copyright 2011 Mazdah.com. All rights reserved.
//

#import "MDCustomTabBarController.h"


@implementation MDCustomTabBarController

@synthesize arrButtonImages, arrButtonTitles, arrButtonClasses;
@synthesize tabBarHeight;
@synthesize tabBarStyle;
@synthesize btnTitle;

@synthesize calView;

/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

- (id)initWithOptions:(NSDictionary *) options
{
    NSLog(@"initWithStyle");
    self = [super init];
    if (self) {
        // Custom initialization
        self.tabBarStyle = [[options valueForKey:@"style"] integerValue];
        
        NSLog([NSString stringWithFormat:@"self.tabBarStyle = %d", self.tabBarStyle]);
        
        if (TABBAR_TYPE_STATIC == self.tabBarStyle) {
            self.tabBarHeight = 50;
        } else if (TABBAR_TYPE_HIDABLE == self.tabBarStyle) {
            self.tabBarHeight = 60;
        } else {
            self.tabBarHeight = [[options valueForKey:@"height"] integerValue];
        }
    }
    return self;
}

#pragma mark - View Memory management

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - Swipe Methods

- (void)swipeLeftAction:(id)ignored {
    float ncalHeight = 70.0f;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    
    // we need to perform some post operations after the animation is complete
    [UIView setAnimationDelegate:self];
    
    [calView resizeCalendar:CGRectMake(10.0f, (480 / 2) - (ncalHeight / 2), ncalHeight, ncalHeight)];
    //   calView.frame = CGRectMake(10.0f, (480 / 2) - (ncalHeight / 2), ncalHeight, ncalHeight);
    
    /*
     [calView removeFromSuperview];
     calView = [[MyCalendarView alloc] initWithFrame:CGRectMake(10.0f, (480 / 2) - (calHeight / 2), calHeight, calHeight) delegate:nil withManagedObjectContext:nil];
     [self.view addSubview:calView];
     [self.view bringSubviewToFront:calView];
     */
    [UIView commitAnimations];
}

- (void)swipeRightAction:(id)ignored {
    float wcalHeight = 300.0f;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    
    // we need to perform some post operations after the animation is complete
    [UIView setAnimationDelegate:self];
    
    [calView resizeCalendar:CGRectMake(10.0f, (480 / 2) - (wcalHeight / 2), wcalHeight, wcalHeight)];
    
    [UIView commitAnimations];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    NSLog(@"viewDidLoad");
    [super viewDidLoad];
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeftAction:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    //swipeLeft.delegate = self;
    [self.view addGestureRecognizer:swipeLeft];
    
    //Swipe Right
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRightAction:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    //swipeRight.delegate = self;
    [self.view addGestureRecognizer:swipeRight];
    
    float calHeight = 70.0f;
    
    calView = [[MyCalendarView alloc] initWithFrame:CGRectMake(10.0f, (480 / 2) - (calHeight / 2), calHeight, calHeight) delegate:self withManagedObjectContext:nil];
    [self.view addSubview:calView];
    [self.view bringSubviewToFront:calView];
    // Do any additional setup after loading the view from its nib.
}

- (void) viewWillAppear:(BOOL)animated {
    NSLog(@"viewWillAppear");
    [super viewWillAppear:animated];
    
    NSLog([NSString stringWithFormat:@"self.tabBarHeight = %d", self.tabBarHeight]);
    UIView *tabBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 480 - self.tabBarHeight, 320, self.tabBarHeight)];
    tabBarView.backgroundColor = [UIColor blueColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(5, 5, 50, 40);
    [button setTitle:self.btnTitle forState:UIControlStateNormal];
    [tabBarView addSubview:button];
    
    [self.view addSubview:tabBarView];
    [tabBarView release];
}

- (void)viewDidUnload
{
    [arrButtonImages release];
    [arrButtonTitles release];
    [arrButtonClasses release];
    
    [calView release];
    
    [btnTitle release];
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


@end
