//
//  HelpView.h
//  100jaargeleden
//
//  Created by Sven Lombaert on 27/03/14.
//  Copyright (c) 2014 Sven Lombaert. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HelpViewDelegate.h"

@interface HelpView : UIView
@property (nonatomic, strong) UILabel *lblStap1;
@property (nonatomic, strong) UILabel *lblStap2;
@property (nonatomic, strong) UILabel *lblStap3;
@property (nonatomic, weak) id<HelpViewDelegate> delegate;
@end
