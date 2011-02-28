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

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    NSLog(@"viewDidLoad");
    [super viewDidLoad];
    
    
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
