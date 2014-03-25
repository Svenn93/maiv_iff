//
//  MainViewController.m
//  100jaargeleden
//
//  Created by Sven Lombaert on 25/03/14.
//  Copyright (c) 2014 Sven Lombaert. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)loadView
{
    CGRect frame = [[UIScreen mainScreen]bounds];
    StartView *v = [[StartView alloc]initWithFrame:frame];
    [self setView:v];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    StartView *v = (StartView *)self.view;
    v.delegate = self;
}

-(void)startButtonClicked
{
    NSLog(@"[MainViewController] er is op de start button geklikt");
    ContentViewController *mapViewVC = [[ContentViewController alloc]initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:mapViewVC animated:YES];
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
