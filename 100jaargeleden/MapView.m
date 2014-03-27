//
//  MapView.m
//  100jaargeleden
//
//  Created by Sven Lombaert on 25/03/14.
//  Copyright (c) 2014 Sven Lombaert. All rights reserved.
//

#import "MapView.h"

@implementation MapView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIImage *image = [UIImage imageNamed:@"mapview_background"];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
        [imageView setFrame:CGRectMake(23, 25, image.size.width, image.size.height)];
        [self addSubview:imageView];
        
        UIImage *compassImage = [UIImage imageNamed:@"compas"];
        UIImageView *compassView = [[UIImageView alloc]initWithImage:compassImage];
        [compassView setFrame:CGRectMake(0, 768-compassImage.size.height, compassImage.size.width, compassImage.size.height)];
        
        UIImage *dagboekImage = [UIImage imageNamed:@"blad_button"];
        self.buttonDagboek = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.buttonDagboek setImage:dagboekImage forState:UIControlStateNormal];
        [self.buttonDagboek setFrame:CGRectMake(1024-dagboekImage.size.width, 98, dagboekImage.size.width, dagboekImage.size.height)];
        
        NSString *stringPath = [[NSBundle mainBundle]pathForResource:@"ieper_straten" ofType:@"mbtiles"];
        NSURL *url = [NSURL fileURLWithPath:stringPath];
        RMMBTilesSource *tileSource = [[RMMBTilesSource alloc]initWithTileSetURL:url];
        
        RMMapboxSource *mapBoxSource = [[RMMapboxSource alloc]initWithMapID:@"svenn93.hkkdghok"];
        
        NSLog(@"De tilesource: %@ met url %@ en stringPath: %@", tileSource, url, stringPath);
        CLLocationCoordinate2D centerPoint = CLLocationCoordinate2DMake(50.8844, 2.8875);
        self.mapView = [[RMMapView alloc] initWithFrame:CGRectMake(40, 45, 950, 680) andTilesource:mapBoxSource];
        
        [self.mapView addTileSource:tileSource];
        [self.mapView setZoom:14];
        [self.mapView setMinZoom:14];
        [self.mapView setMaxZoom:15.5];
        [self.mapView setCenterCoordinate:centerPoint];
        [self addSubview:self.mapView];
        [self addSubview:compassView];
        [self addSubview:self.buttonDagboek];
        
        self.mapView.showsUserLocation = YES;
        //self.mapView.userTrackingMode = RMUserTrackingModeFollow;
        RMPointAnnotation *annotation = [[RMPointAnnotation alloc]initWithMapView:self.mapView coordinate:CLLocationCoordinate2DMake(50.8788,2.8883) andTitle:@"Dit is een test"];
        
        self.nextTarget = CLLocationCoordinate2DMake(50.8788,2.8883);

        annotation.image = [UIImage imageNamed:@"annotation_icon"];
        [self.mapView addAnnotation:annotation];
        
        self.locationManager = [[CLLocationManager alloc]init];
        self.locationManager.delegate = self;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        [self.locationManager startUpdatingLocation];

    }
    return self;
}

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    /*NSString *currentLatitude = [[NSString alloc] initWithFormat:@"%+.6f", newLocation.coordinate.latitude];
    NSLog(@"De currentLatitude: %@", currentLatitude);
    
    NSString *currentLongitude = [[NSString alloc] initWithFormat:@"%+.6f", newLocation.coordinate.longitude];
    NSLog(@"De currentLatitude: %@", currentLongitude);
    
    NSString *currentHorizontalAccuracy =[[NSString alloc] initWithFormat:@"%+.6f", newLocation.horizontalAccuracy];
    NSLog(@"De currentHorizontalAccuracy: %@", currentHorizontalAccuracy);
    
    NSString *currentAltitude = [[NSString alloc] initWithFormat:@"%+.6f", newLocation.altitude];
    NSLog(@"De currentAltitude: %@",currentAltitude);
    
    NSString *currentVerticalAccuracy = [[NSString alloc]initWithFormat:@"%+.6f",newLocation.verticalAccuracy];
    NSLog(@"De currentverticalAccuracy: %@",currentVerticalAccuracy);*/

    CLLocation *target = [[CLLocation alloc]initWithLatitude:self.nextTarget.latitude longitude:self.nextTarget.longitude];
    
    CLLocationDistance distanceBetween = [newLocation distanceFromLocation:target];
    if(distanceBetween <= (double)50){
        if(!self.meldingShown){
            [self showMelding];
        }
    }else{
        if(self.meldingShown){
            [self hideCurrentMelding];
        }
    }
}

-(void)showMelding
{
    self.meldingShown = YES;
    NSLog(@"Ik toon de melding");
    self.popupView = [[PopUpView alloc]initWithFrame:CGRectMake(1024, 768-670, 430, 670)];
    self.popupView.delegate = self;
    [self addSubview:self.popupView];
    [UIView animateWithDuration:0.5 animations:^{ self.popupView.frame = CGRectMake(1024-430, 768-670, 430, 670); }];
}

-(void)hideCurrentMelding
{
    self.meldingShown = NO;
    NSLog(@"Ik sluit de melding");
    if(self.popupView.superview){
       [UIView animateWithDuration:0.5 animations:^{ self.popupView.frame = CGRectMake(1024, 768-670, 430, 670); } completion:^(BOOL finished){ [self.popupView removeFromSuperview];}];
    }
}

-(void)popupButtonClicked
{
    [self.locationManager stopUpdatingLocation];
    [self hideCurrentMelding];
}



@end
