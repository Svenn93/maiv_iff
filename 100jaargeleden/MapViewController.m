//
//  ContentViewController.m
//  100jaargeleden
//
//  Created by Sven Lombaert on 25/03/14.
//  Copyright (c) 2014 Sven Lombaert. All rights reserved.
//

#import "MapViewController.h"
#import "DagboekViewController.h"
#import "NavigationViewController+Retro.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        NSString *situatiesPath = [[NSBundle mainBundle] pathForResource:@"situaties" ofType:@"json"];
        NSData *jsonData = [NSData dataWithContentsOfFile:situatiesPath];
        NSError *errorJSON = nil;
        
        NSArray *loadedData = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&errorJSON];
        if(!errorJSON){
            self.situaties = [[NSMutableArray alloc]init];
            for (NSDictionary *dict in loadedData)
            {
                [self.situaties addObject:[SituatieFactory createSituatieWithDictionary:dict]];
            }
            
        }else{
            NSLog(@"TGA NIE :'(");
        }
        
        NSString *keuzesPath = [[NSBundle mainBundle] pathForResource:@"keuzes" ofType:@"json"];
        NSData *jsonKeuzesData = [NSData dataWithContentsOfFile:keuzesPath];
        NSError *errorJSONkeuzes = nil;
        
        NSArray *loadedKeuzesData = [NSJSONSerialization JSONObjectWithData:jsonKeuzesData options:NSJSONReadingMutableContainers error:&errorJSONkeuzes];
        if(!errorJSONkeuzes){
            self.keuzes = [[NSMutableArray alloc]init];
            for (NSDictionary *dict in loadedKeuzesData)
            {
                [self.keuzes addObject:[KeuzeFactory createKeuzeWithDictionary:dict]];
            }
            
        }else{
            NSLog(@"TGA NIE :'(");
        }
        
        NSString *uitkomstPath = [[NSBundle mainBundle] pathForResource:@"uitkomst" ofType:@"json"];
        NSData *jsonUitkomstData = [NSData dataWithContentsOfFile:uitkomstPath];
        NSError *errorJSONuitkomst = nil;
        
        NSArray *loadedUitkomstData = [NSJSONSerialization JSONObjectWithData:jsonUitkomstData options:NSJSONReadingMutableContainers error:&errorJSONuitkomst];
        if(!errorJSONuitkomst){
            self.uitkomsten = [[NSMutableArray alloc]init];
            for (NSDictionary *dict in loadedUitkomstData)
            {
                [self.uitkomsten addObject:[UitkomstFactory createKeuzeWithDictionary:dict]];
            }
            
        }else{
            NSLog(@"TGA NIE :'(");
        }

    }
    return self;
}

-(void) loadView{
    CGRect frame = [[UIScreen mainScreen]bounds];
    self.mapv= [[MapView alloc] initWithFrame:frame];
    self.mapv.delegate = self;
    [self setView:self.mapv];
    [self.mapv updateMapWithSituaties:self.situaties andKeuzes:self.keuzes andUitkomsten:self.uitkomsten];
}

-(void)dagboekButtonTapped
{
    DagboekViewController *dgbVC = [[DagboekViewController alloc]initWithNibName:nil bundle:nil];
    [(NavigationViewController *)self.navigationController pushViewControllerRetro:dgbVC fromDirection:@"right"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
