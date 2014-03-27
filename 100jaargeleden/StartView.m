//
//  StartView.m
//  100jaargeleden
//
//  Created by Sven Lombaert on 25/03/14.
//  Copyright (c) 2014 Sven Lombaert. All rights reserved.
//

#import "StartView.h"

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
        
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
        [paragraphStyle setLineSpacing:7];
        
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:@"Achter meerdere malen teruggetrokken te zijn en al vele gruwelen meegemaakt te hebben zit Emiel met zijn peloton vlakbij de yorkshire trench & dug-out. Kapitein delafosse heeft het order gegeven daar te gaan versterken tegen een Duits offensief."];
        
        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, attributedString.string.length)];
        [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Albertsthal_Typewriter" size:18] range:NSMakeRange(0, attributedString.string.length)];
        [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, attributedString.string.length)];
        CGFloat width = 420.f;
        CGRect rect = [attributedString boundingRectWithSize:CGSizeMake(width, 10000) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];
        
        self.lblUitleg = [[UILabel alloc]initWithFrame:CGRectMake(50, 200, 420, ceilf(rect.size.height))];
        NSLog(@"De string: %@",attributedString);
        self.lblUitleg.lineBreakMode = NSLineBreakByWordWrapping;
        self.lblUitleg.textAlignment = NSTextAlignmentLeft;
        self.lblUitleg.numberOfLines = 0;
        [self.lblUitleg setTextColor:[UIColor blackColor]];
        [self.lblUitleg setTransform:CGAffineTransformMakeRotation(-3*(M_PI/180))];
        self.lblUitleg.attributedText = attributedString;
        [self.lblUitleg sizeToFit];

        
        [self addSubview:imageView];
        [self addSubview:self.btnStart];
        [self addSubview:self.lblUitleg];
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
