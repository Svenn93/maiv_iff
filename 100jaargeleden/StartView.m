//
//  StartView.m
//  100jaargeleden
//
//  Created by Sven Lombaert on 25/03/14.
//  Copyright (c) 2014 Sven Lombaert. All rights reserved.
//

#import "StartView.h"
#import "LabelFactory.h"

@implementation StartView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIImage *image = [UIImage imageNamed:@"intro"];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
        [imageView setFrame:CGRectMake(0, 9, image.size.width, image.size.height)];
        
        UIImage *btnImage = [UIImage imageNamed:@"start_button"];
        
        self.btnStart = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.btnStart setImage:btnImage forState:UIControlStateNormal];
        [self.btnStart setFrame:CGRectMake((1024-btnImage.size.width)/2, 580, btnImage.size.width, btnImage.size.height)];
        [self.btnStart addTarget:self action:@selector(startButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        
        UILabel *lblUitleg = [LabelFactory createTypewriterLabelWithText:@"Achter meerdere malen teruggetrokken te zijn en al vele gruwelen meegemaakt te hebben zit Emiel met zijn peloton vlakbij de yorkshire trench & dug-out. Kapitein delafosse heeft het order gegeven daar te gaan versterken tegen een Duits offensief." andXPos:50 andYPos:200 andWidth:420 andRotation:-3 andFontSize:18 andKerning:@0];
        
        [self addSubview:imageView];
        [self addSubview:lblUitleg];
        [self addSubview:self.btnStart];
    }
    return self;
}

-(void)startButtonTapped:(id)sender{
    NSLog(@"[StartView] er werd op de button geklikt");
    [self.delegate startButtonClicked];
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
