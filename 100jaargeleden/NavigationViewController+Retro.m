//
//  NavigationViewController+Retro.m
//  100jaargeleden
//
//  Created by Sven Lombaert on 26/03/14.
//  Copyright (c) 2014 Sven Lombaert. All rights reserved.
//

#import "NavigationViewController+Retro.h"
//fix voor de animatie met transparent views. Anders bugt de animatie => niet via dit.
@implementation NavigationViewController (Retro)
- (void)pushViewControllerRetro:(UIViewController *)viewController fromDirection:(NSString *)direction {
    CATransition *transition = [CATransition animation];
    transition.duration = 0.35;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    if ([direction  isEqual: @"right"]) {
        [[UIDevice currentDevice]orientation]==UIDeviceOrientationLandscapeLeft ? (transition.subtype = kCATransitionFromTop) : (transition.subtype = kCATransitionFromBottom);
    }else if([direction isEqual:@"left"]){
        [[UIDevice currentDevice]orientation]==UIDeviceOrientationLandscapeRight ? (transition.subtype = kCATransitionFromTop) : (transition.subtype = kCATransitionFromBottom);
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
