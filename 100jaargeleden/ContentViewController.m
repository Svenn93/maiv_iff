//
//  ContentViewController.m
//  100jaargeleden
//
//  Created by Sven Lombaert on 25/03/14.
//  Copyright (c) 2014 Sven Lombaert. All rights reserved.
//

#import "ContentViewController.h"

@interface ContentViewController ()

@end

@implementation ContentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) loadView{
    CGRect frame = [[UIScreen mainScreen]bounds];
    self.v = [[ContentScrollView alloc] initWithFrame:frame];
    [self setView:self.v];
    
    self.mapv= [[MapView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
    self.mapv.delegate = self;
    self.diaryv = [[DiaryView alloc] initWithFrame:CGRectMake(1024, 0, 1024, 768)];
    [self.v addSubview:self.mapv];
    [self.v addSubview:self.diaryv];
    self.v.contentSize = CGSizeMake(2048, 768);
    self.v.pagingEnabled = YES;
    self.v.bounces = NO;
    
    
}

- (void)didSwipeLeft{
    [self.v setContentOffset:CGPointMake(1024, 0) animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)initMap {
    NSLog(@"[ContenViewController] initializing map");
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
