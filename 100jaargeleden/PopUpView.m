//
//  PopUpView.m
//  100jaargeleden
//
//  Created by Sven Lombaert on 27/03/14.
//  Copyright (c) 2014 Sven Lombaert. All rights reserved.
//

#import "PopUpView.h"
#import "LabelFactory.h"

@implementation PopUpView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIImage *image = [UIImage imageNamed:@"popup"];
        UIImageView *iv = [[UIImageView alloc]initWithImage:image];
        [iv setFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
        
        UIImage *btnImage = [[UIImage alloc]init];
        if([self.type isEqual:@"situatie"]){
            btnImage = [UIImage imageNamed:@"situatie_button"];
        }else{
            btnImage = [UIImage imageNamed:@"keuzeMaken"];
        }
        NSLog(@"Het verhaal: %@", [self.info valueForKey:@"verhaal"]);
        NSLog(@"Het path: %@", [self.info valueForKey:@"fotoPath"]);
        UIImage *imageUitleg = [UIImage imageNamed:[self.info valueForKey:@"fotoPath"]];
        UIImageView *imageUitlegV = [[UIImageView alloc]initWithImage:imageUitleg];
        [imageUitlegV setFrame:CGRectMake(5, 5, imageUitleg.size.width, imageUitleg.size.height)];
        
        UILabel *uitleg = [LabelFactory createTypewriterLabelWithText:[self.info valueForKey:@"verhaal"] andXPos:55 andYPos:310 andWidth:335 andRotation:-2 andFont:@"Courier" andFontSize:17 andKerning:@-5 andLineHeight:5];
        
        self.confirmationButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.confirmationButton setImage:btnImage forState:UIControlStateNormal];
        [self.confirmationButton setFrame:CGRectMake(100, 545, btnImage.size.width, btnImage.size.height)];
        [self.confirmationButton addTarget:self action:@selector(confirmationButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:iv];
        [self addSubview:uitleg];
        [self addSubview:imageUitlegV];
        [self addSubview:self.confirmationButton];
        
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame andInfo:(NSObject *)info andType:(NSString *)type
{
    self.info = info;
    self.type = type;
    return [self initWithFrame:frame];
}

-(void) confirmationButtonTapped:(id)sender
{
    NSLog(@"[POPUPVIEW] button clicked");
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