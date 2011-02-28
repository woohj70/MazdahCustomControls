//
//  MDCustomTabBarController.h
//  MazdahCustomControls
//
//  Created by HYOUNG JUN WOO on 11. 2. 23..
//  Copyright 2011 Mazdah.com. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MyCalendarView.h"

#define TABBAR_TYPE_STATIC  0
#define TABBAR_TYPE_HIDABLE 1
#define TABBAR_TYPE_CUSTOM  2

@interface MDCustomTabBarController : UIViewController {
    NSInteger   tabBarStyle;
    
    NSArray *arrButtonImages;
    NSArray *arrButtonTitles;
    NSArray *arrButtonClasses;
    
    NSInteger   tabBarHeight;
    
    NSString    *btnTitle;
    
    MyCalendarView *calView;
}

@property (nonatomic, retain) NSArray *arrButtonImages;
@property (nonatomic, retain) NSArray *arrButtonTitles;
@property (nonatomic, retain) NSArray *arrButtonClasses;

@property (nonatomic) NSInteger   tabBarStyle;
@property (nonatomic) NSInteger   tabBarHeight;

@property (nonatomic, retain) NSString    *btnTitle;
@property (nonatomic, retain) MyCalendarView *calView;

@end
