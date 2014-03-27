//
//  HelpView.m
//  100jaargeleden
//
//  Created by Sven Lombaert on 27/03/14.
//  Copyright (c) 2014 Sven Lombaert. All rights reserved.
//

#import "HelpView.h"

@implementation HelpView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIImage *image = [UIImage imageNamed:@"help"];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
        [imageView setFrame:CGRectMake(0, 16, image.size.width, image.size.height)];
        
        self.lblStap1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 300, 400)];
        self.lblStap2 = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, 300, 400)];
        self.lblStap3 = [[UILabel alloc]initWithFrame:CGRectMake(0, 200, 300, 4000)];
        
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
        [paragraphStyle setLineSpacing:7];
        
        UIFont *font = [UIFont fontWithName:@"Albertsthal_Typewriter" size:18];
        UIColor *color = [UIColor blackColor];
        
        NSMutableAttributedString *attributedStringStap1 = [[NSMutableAttributedString alloc]initWithString:@"Achter meerdere malen teruggetrokken te zijn en al vele gruwelen meegemaakt te hebben zit Emiel met zijn peloton vlakbij de yorkshire trench & dug-out. Kapitein delafosse heeft het order gegeven daar te gaan versterken tegen een Duits offensief."];

        CGFloat width = 420.f;
        CGRect rect = [attributedStringStap1 boundingRectWithSize:CGSizeMake(width, 10000) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];
        
        NSDictionary *attributes = [[NSDictionary alloc]initWithObjects:[[NSArray alloc]initWithObjects:paragraphStyle,font,color, nil] forKeys:[[NSArray alloc]initWithObjects:NSParagraphStyleAttributeName, NSFontAttributeName, NSForegroundColorAttributeName, nil]];
        
        [attributedStringStap1 addAttributes:attributes range:NSMakeRange(0, attributedStringStap1.string.length)];
        
        self.lblStap1 = [[UILabel alloc]initWithFrame:CGRectMake(50, 200, 420, ceilf(rect.size.height))];
        NSLog(@"De string: %@",attributedStringStap1);
        self.lblStap1.lineBreakMode = NSLineBreakByWordWrapping;
        self.lblStap1.textAlignment = NSTextAlignmentLeft;
        self.lblStap1.numberOfLines = 0;
        [self.lblStap1 setTextColor:[UIColor blackColor]];
        [self.lblStap1 setTransform:CGAffineTransformMakeRotation(-3*(M_PI/180))];
        self.lblStap1.attributedText = attributedStringStap1;
        [self.lblStap1 sizeToFit];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        [button setTitle:@"Ga naar map" forState:UIControlStateNormal];
        [button setFrame:CGRectMake(300, 700, 200, 40)];
        [button addTarget:self action:@selector(mapButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:imageView];
        [self addSubview:button];
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
