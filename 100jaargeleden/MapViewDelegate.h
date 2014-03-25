//
//  MapViewDelegate.h
//  100jaargeleden
//
//  Created by Sven Lombaert on 25/03/14.
//  Copyright (c) 2014 Sven Lombaert. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MapViewDelegate <NSObject>

@required
- (void)didSwipeLeft;

@end
