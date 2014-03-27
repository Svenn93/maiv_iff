//
//  HelpView.m
//  100jaargeleden
//
//  Created by Sven Lombaert on 27/03/14.
//  Copyright (c) 2014 Sven Lombaert. All rights reserved.
//

#import "HelpView.h"
#import "LabelFactory.h"

@implementation HelpView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIImage *image = [UIImage imageNamed:@"help"];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
        [imageView setFrame:CGRectMake(0, 16, image.size.width, image.size.height)];
        
        UIImage *buttonImage = [UIImage imageNamed:@"begrepen_button"];
        self.startButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.startButton setImage:buttonImage forState:UIControlStateNormal];
        [self.startButton setFrame:CGRectMake((1024-buttonImage.size.width)/2, 585, buttonImage.size.width, buttonImage.size.height)];
        [self.startButton addTarget:self action:@selector(mapButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        self.lblStap1 = [LabelFactory createTypewriterLabelWithText:@"Navigeer naar de aangeduide \npunten." andXPos:150 andYPos:225 andWidth:360 andRotation:0 andFontSize:24 andKerning:@-2];
        self.lblStap2 = [LabelFactory createTypewriterLabelWithText:@"Draai naar de markers voor \nmeer uitleg." andXPos:150 andYPos:345 andWidth:360 andRotation:0 andFontSize:24 andKerning:@-2];
        self.lblStap3 = [LabelFactory createTypewriterLabelWithText:@"Maak een keuze en schrijf geschiedenis." andXPos:150 andYPos:480 andWidth:360 andRotation:0 andFontSize:24 andKerning:@-2];
        
        UIImage *image1 = [UIImage imageNamed:@"cart_icon"];
        self.ivIcon1 = [[UIImageView alloc]initWithImage:image1];
        [self.ivIcon1 setFrame:CGRectMake(75, 220, image1.size.width, image1.size.height)];
        UIImage *image2 = [UIImage imageNamed:@"gesture_icon"];
        self.ivIcon2 = [[UIImageView alloc]initWithImage:image2];
        [self.ivIcon2 setFrame:CGRectMake(60, 342, image2.size.width, image2.size.height)];
        UIImage *image3 = [UIImage imageNamed:@"diary-icon"];
        self.ivIcon3 = [[UIImageView alloc]initWithImage:image3];
        [self.ivIcon3 setFrame:CGRectMake(75, 476, image3.size.width, image3.size.height)];
        
        [self addSubview:imageView];
        [self addSubview:self.lblStap1];
        [self addSubview:self.lblStap2];
        [self addSubview:self.lblStap3];
        [self addSubview:self.ivIcon1];
        [self addSubview:self.ivIcon2];
        [self addSubview:self.ivIcon3];
        [self addSubview:self.startButton];
    }
    return self;
}

- (void)mapButtonClicked:(id)sender
{
    NSLog(@"Ga naar map");
    [self.delegate mapButtonClicked];
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
