//
//  NavigationViewController+Retro.h
//  100jaargeleden
//
//  Created by Sven Lombaert on 26/03/14.
//  Copyright (c) 2014 Sven Lombaert. All rights reserved.
//

#import "NavigationViewController.h"

@interface NavigationViewController (Retro)
- (void)pushViewControllerRetro:(UIViewController *)viewController fromDirection:(NSString *)direction;
- (void)popViewControllerRetro;
@end
