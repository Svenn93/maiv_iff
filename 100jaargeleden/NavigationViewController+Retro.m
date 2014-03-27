//
//  NavigationViewController+Retro.m
//  100jaargeleden
//
//  Created by Sven Lombaert on 26/03/14.
//  Copyright (c) 2014 Sven Lombaert. All rights reserved.
//

#import "NavigationViewController+Retro.h"

@implementation NavigationViewController (Retro)
- (void)pushViewControllerRetro:(UIViewController *)viewController fromDirection:(NSString *)direction {
    CATransition *transition = [CATransition animation];
    transition.duration = 0.35;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    if ([direction  isEqual: @"right"]) {
        transition.subtype = kCATransitionFromBottom;
    }else if([direction isEqual:@"left"]){
        transition.subtype = kCATransitionFromTop;
    }
    [self.view.layer addAnimation:transition forKey:nil];
    
    [self pushViewController:viewController animated:NO];
}

- (void)popViewControllerRetro {
    CATransition *transition = [CATransition animation];
    transition.duration = 0.25;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromLeft;
    [self.view.layer addAnimation:transition forKey:nil];
    
    [self popViewControllerAnimated:NO];
}
@end
