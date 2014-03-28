//
//  MapView.h
//  100jaargeleden
//
//  Created by Sven Lombaert on 25/03/14.
//  Copyright (c) 2014 Sven Lombaert. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RMMapView.h>
#import <RMMBTilesSource.h>
#import <RMMapboxSource.h>
#import <RMPointAnnotation.h>
#import <RMTileCache.h>
#import <RMShape.h>
#import "PopUpView.h"
#import <RMMarker.h>
#import "SituatieData.h"
#import "MapViewDelegate.h"

@interface MapView : UIView <UIGestureRecognizerDelegate, CLLocationManagerDelegate, PopUpViewDelegate, RMMapViewDelegate>


@property (nonatomic, strong) RMMapView *mapView;
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) UIButton *buttonDagboek;
@property (nonatomic, strong) PopUpView *popupView;
@property (nonatomic, strong) NSMutableArray *points;
@property (nonatomic, strong) NSMutableArray *situaties;
@property (nonatomic, strong) NSMutableArray *keuzes;
@property (nonatomic, strong) NSMutableArray *targets;
@property (nonatomic, strong) NSMutableArray *uitkomsten;
@property (nonatomic, strong) NSMutableArray *keuzeAnnotations;
@property (nonatomic, strong) NSMutableDictionary *dagboekVerhalen;
@property (nonatomic) BOOL meldingShown;
@property (nonatomic) int situatieid;
@property (nonatomic, weak) id<MapViewDelegate> delegate;
- (void)updateMapWithSituaties:(NSMutableArray *)situatieArray andKeuzes:(NSMutableArray *)keuzeArray andUitkomsten:(NSMutableArray *)uitkomstenArray;
@end
