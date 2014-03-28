//
//  ContentViewController.h
//  100jaargeleden
//
//  Created by Sven Lombaert on 25/03/14.
//  Copyright (c) 2014 Sven Lombaert. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapView.h"
#import "DagBoekView.h"
#import "KeuzeFactory.h"
#import "SituatieFactory.h"
#import "UitkomstFactory.h"

@interface MapViewController : UIViewController<MapViewDelegate>


@property (nonatomic, strong) MapView *mapv;
@property (nonatomic, strong) NSMutableArray *situaties;
@property (nonatomic, strong) NSMutableArray *keuzes;
@property (nonatomic, strong) NSMutableArray *uitkomsten;
@end
