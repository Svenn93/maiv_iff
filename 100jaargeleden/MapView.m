//
//  MapView.m
//  100jaargeleden
//
//  Created by Sven Lombaert on 25/03/14.
//  Copyright (c) 2014 Sven Lombaert. All rights reserved.
//

#import "MapView.h"

@implementation MapView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor redColor];
        
        self.mapView = [[RMMapView alloc] initWithFrame:frame];
        [self addSubview:self.mapView];
        
        
        UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeft)];
        swipeLeft.delegate = self;
        swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
        [self.mapView addGestureRecognizer:swipeLeft];
    }
    return self;
}

- (void)swipeLeft {
    NSLog(@"swipe left!");
    [self.delegate didSwipeLeft];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    
    NSLog(@"hello");
    
    return YES;
    
}


@end
