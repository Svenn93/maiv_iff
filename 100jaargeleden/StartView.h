//
//  StartView.h
//  100jaargeleden
//
//  Created by Sven Lombaert on 25/03/14.
//  Copyright (c) 2014 Sven Lombaert. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StartViewDelegate.h"

@interface StartView : UIView

@property (nonatomic, strong) UIButton *btnStart;
@property (nonatomic, weak) id<StartViewDelegate> delegate;
@end
