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
        self.backgroundColor = [UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f alpha:1.0f];
        
        self.btnStart = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.btnStart setTitle:@"Start App" forState:UIControlStateNormal];
        [self.btnStart setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
        [self.btnStart setFrame:CGRectMake(362, 400, 300, 40)];
        [self.btnStart addTarget:self action:@selector(startButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        
        self.lblUitleg = [[UILabel alloc]initWithFrame:CGRectMake(112, 200, 800, 200)];
        self.lblUitleg.lineBreakMode = NSLineBreakByWordWrapping;
        self.lblUitleg.textAlignment = NSTextAlignmentLeft;
        self.lblUitleg.numberOfLines = 0;
        [self.lblUitleg setText:@"'I keep them to sell,' the Hatter added as an explanation' I've none of  my own. I'm a hatter.'Here the Queen put on her spectacles, and began staring at the Hatter  who turned pale and fidgeted.'Give your evidence,' said the King; 'and don't be nervous, or I'll have  you executed on the spot.'"];
        [self.lblUitleg setTextColor:[UIColor whiteColor]];
        [self.lblUitleg setBackgroundColor:[UIColor blackColor]];
        
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
