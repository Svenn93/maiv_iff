//
//  PopUpView.m
//  100jaargeleden
//
//  Created by Sven Lombaert on 27/03/14.
//  Copyright (c) 2014 Sven Lombaert. All rights reserved.
//

#import "PopUpView.h"

@implementation PopUpView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIImage *image = [UIImage imageNamed:@"popup"];
        UIImageView *iv = [[UIImageView alloc]initWithImage:image];
        [iv setFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
        
        UIImage *btnImage = [UIImage imageNamed:@"situatie_button"];
        self.showChoices = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.showChoices setImage:btnImage forState:UIControlStateNormal];
        [self.showChoices setFrame:CGRectMake(100, 520, btnImage.size.width, btnImage.size.height)];
        [self.showChoices addTarget:self action:@selector(showChoices:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:iv];
        [self addSubview:self.showChoices];
    }
    return self;
}

-(void) showChoices:(id)sender
{
    NSLog(@"Show them choices boyyyyy");
    [self.delegate popupButtonClicked];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
