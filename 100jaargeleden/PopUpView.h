//
//  PopUpView.h
//  100jaargeleden
//
//  Created by Sven Lombaert on 27/03/14.
//  Copyright (c) 2014 Sven Lombaert. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopUpViewDelegate.h"

@interface PopUpView : UIView
@property (nonatomic, strong) UIButton *showChoices;
@property (nonatomic, weak) id<PopUpViewDelegate> delegate;

@end
