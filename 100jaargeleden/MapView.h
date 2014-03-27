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
#import "PopUpView.h"

@interface MapView : UIView <UIGestureRecognizerDelegate, CLLocationManagerDelegate, PopUpViewDelegate, RMMapViewDelegate>


@property (nonatomic, strong) RMMapView *mapView;
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, assign) CLLocationCoordinate2D nextTarget;
@property (nonatomic, strong) UIButton *buttonDagboek;
@property (nonatomic, strong) PopUpView *popupView;
@property (nonatomic) BOOL meldingShown;
@end
