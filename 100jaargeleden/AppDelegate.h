//
//  AppDelegate.h
//  100jaargeleden
//
//  Created by Sven Lombaert on 25/03/14.
//  Copyright (c) 2014 Sven Lombaert. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
#import "NavigationViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) MainViewController *mainVC;

@end
