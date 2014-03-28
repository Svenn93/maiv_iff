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
        self.dagboekVerhalen = [[NSMutableDictionary alloc]init];
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
        [self.buttonDagboek addTarget:self action:@selector(dagboekButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        
        NSString *stringPath = [[NSBundle mainBundle]pathForResource:@"ieper_straten" ofType:@"mbtiles"];
        NSURL *url = [NSURL fileURLWithPath:stringPath];
        RMMBTilesSource *tileSource = [[RMMBTilesSource alloc]initWithTileSetURL:url];
        
        RMMapboxSource *mapBoxSource = [[RMMapboxSource alloc]initWithMapID:@"svenn93.hkkdghok"];
        
        NSLog(@"De tilesource: %@ met url %@ en stringPath: %@", tileSource, url, stringPath);
        CLLocationCoordinate2D centerPoint = CLLocationCoordinate2DMake(50.8844, 2.8875);
        self.mapView = [[RMMapView alloc] initWithFrame:CGRectMake(40, 45, 950, 680) andTilesource:tileSource];
        self.mapView.delegate = self;
        
        [self.mapView addTileSource:mapBoxSource atIndex:0];
        [self.mapView setZoom:14];
        [self.mapView setMinZoom:14];
        [self.mapView setMaxZoom:15.5];
        [self.mapView setCenterCoordinate:centerPoint];
        [self addSubview:self.mapView];
        [self addSubview:compassView];
        [self addSubview:self.buttonDagboek];
        self.mapView.showsUserLocation = YES;
        
        //DRAW ROUTE
        NSString *path = [[NSBundle mainBundle] pathForResource:@"route" ofType:@"geojson"];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[[NSData alloc] initWithContentsOfFile:path] options:0 error:&error];
        
        for (NSUInteger i = 0; i < [[json objectForKey:@"features"] count]; i++)
        {
            self.points = [[[[[json objectForKey:@"features"] objectAtIndex:i] valueForKey:@"geometry"] valueForKey:@"coordinates"]mutableCopy];
            for (NSUInteger i = 0; i < [self.points count]; i++)
            {
                [self.points replaceObjectAtIndex:i withObject:[[CLLocation alloc] initWithLatitude:[[[self.points objectAtIndex:i] objectAtIndex:1] doubleValue]
                                                                                          longitude:[[[self.points objectAtIndex:i] objectAtIndex:0] doubleValue]]];
            }
            RMAnnotation *routeAnnotation = [[RMAnnotation alloc] initWithMapView:self.mapView coordinate:self.mapView.centerCoordinate andTitle:@"My Path"];
            routeAnnotation.title = @"route";
            [self.mapView addAnnotation:routeAnnotation];
            [routeAnnotation setBoundingBoxFromLocations:self.points];
        }
        //EINDE DRAW ROUTE
    }
    return self;
}

- (void)updateMapWithSituaties:(NSMutableArray *)situatieArray andKeuzes:(NSMutableArray *)keuzeArray andUitkomsten:(NSMutableArray *)uitkomstenArray
{
    self.targets = [[NSMutableArray alloc]init];
    self.keuzes = keuzeArray;
    self.situaties = situatieArray;
    self.uitkomsten = uitkomstenArray;
    
    NSLog(@"DE UITKOMSTEN: %@", self.uitkomsten);
    
    NSMutableArray *annotations = [[NSMutableArray alloc]init];
    int lengte = [situatieArray count];
    NSLog(@"De lengte is: %i", lengte);
    for (int i = 0; i<=lengte-1; i++)
    {
        SituatieData *situatie = [situatieArray objectAtIndex:i];
        CLLocation *locatie = [[CLLocation alloc]initWithLatitude:situatie.lat longitude:situatie.lon];
        [self.targets addObject:locatie];
        
        RMAnnotation *annotation = [[RMAnnotation alloc]initWithMapView:self.mapView coordinate:CLLocationCoordinate2DMake(situatie.lat, situatie.lon) andTitle:@"Situatie"];
        annotation.userInfo = situatie;
        [annotations addObject:annotation];
    }
    [self.mapView addAnnotations:annotations];

    //START UPDATING LOCATION
    self.locationManager = [[CLLocationManager alloc]init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager startUpdatingLocation];
}

- (RMMapLayer *)mapView:(RMMapView *)mapView layerForAnnotation:(RMAnnotation *)annotation
{
    NSLog(@"De annotation title: %@", annotation.title);
    if([annotation.title  isEqual: @"Situatie"]){
        RMMarker *marker;
        marker = [[RMMarker alloc] initWithUIImage:[UIImage imageNamed:@"annotation_icon"]];
        marker.canShowCallout = NO;
        return marker;
        
    }else if([annotation.title isEqual:@"route"])
    {
        RMShape *shape = [[RMShape alloc] initWithView:mapView];
        
        shape.lineColor = [UIColor blackColor];
        shape.lineWidth = 3.0;
        shape.lineDashLengths = [NSArray arrayWithObjects:@8,@10,nil];
        
        for (CLLocation *point in self.points)
        {
            [shape addLineToCoordinate:point.coordinate];
        }
        return shape;
    }else if([annotation.title isEqual:@"keuze"])
    {
        RMMarker *marker;
        marker = [[RMMarker alloc] initWithUIImage:[UIImage imageNamed:@"KeuzeMarker"]];
        marker.canShowCallout = NO;
        return marker;
    }
    return nil;
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
    
    int lengte = [self.targets count];
    NSLog(@"De target lengte: %lu", (unsigned long)[self.targets count]);
    for(int i = 0; i<= lengte-1; i++){
        NSLog(@"-----------");
        NSLog(@"De i: %i, Het target: %@", i,[self.targets objectAtIndex:i]);
        NSLog(@"-----------");
        CLLocation *target = [self.targets objectAtIndex:i];
        CLLocationDistance distanceBetween = [newLocation distanceFromLocation:target];
        NSLog(@"De distance is: %f en het target is: %@", distanceBetween, target);
        if(distanceBetween <= (double)50){
            if(!self.meldingShown){
                self.situatieid = i+1;
                [self showMelding];
                break;
            }
        }else{
            if(self.meldingShown){
                [self hideCurrentMelding];
            }
        }
    }

}

-(void)showMelding
{
    
    [self.locationManager stopUpdatingLocation];
    NSObject *situatieInfo = [self.situaties objectAtIndex:self.situatieid-1];
    self.meldingShown = YES;
    NSLog(@"Ik toon de melding");
    NSLog(@"[MAPVIEW] de situaties: %@ , de situatie: %@", self.situaties, situatieInfo);
    self.popupView = [[PopUpView alloc]initWithFrame:CGRectMake(1024, 768-670, 430, 670) andInfo:situatieInfo andType:@"situatie"];
    //self.popupView = [[PopUpView alloc]initWithFrame:CGRectMake(1024, 768-670, 430, 670)];
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
    NSLog(@"POPUPBUTTON CLICKED");
    

    if([self.popupView.type isEqual:@"situatie" ]){
        //inladen keuzes
        [self hideCurrentMelding];
        NSMutableArray *keuzesForSituatie = [[NSMutableArray alloc]init];
        self.keuzeAnnotations = [[NSMutableArray alloc]init];
        int lengte = [self.keuzes count];
        for(int i=0; i<=lengte-1; i++)
        {
            if([[[self.keuzes objectAtIndex:i]valueForKey:@"situatieID"]intValue] == self.situatieid){
                NSObject *keuze = [self.keuzes objectAtIndex:i];
                NSLog(@"De keuze is:  %@", [[self.keuzes objectAtIndex:i]valueForKeyPath:@"verhaal"]);
                RMAnnotation *keuzeAnnotation = [[RMAnnotation alloc]initWithMapView:self.mapView coordinate:CLLocationCoordinate2DMake([[keuze valueForKeyPath:@"lat"]doubleValue], [[keuze valueForKeyPath:@"lon"]doubleValue]) andTitle:@"keuze"];
                [self.mapView addAnnotation:keuzeAnnotation];
                [self.keuzeAnnotations addObject:keuzeAnnotation];
                keuzeAnnotation.userInfo = keuze;
                [keuzesForSituatie addObject:[self.keuzes objectAtIndex:i]];
            }
        }
    }else{
        //uitkomst kiezen
        NSLog(@"Het keuze id is: %@", [self.popupView.info valueForKey:@"keuzeID"]);
        int keuzeid = [[self.popupView.info valueForKey:@"keuzeID"]intValue];
        int situatieid= [[self.popupView.info valueForKey:@"situatieID"]intValue];
        
        int lengte = [self.uitkomsten count];
        for(int i=0; i<=lengte-1; i++)
        {
            if([[[self.uitkomsten objectAtIndex:i]valueForKey:@"keuzeID"]intValue] == keuzeid){
                NSObject *uitkomst = [self.uitkomsten objectAtIndex:i];
                NSLog(@"De uitkomst is:  %@", [[self.keuzes objectAtIndex:i]valueForKeyPath:@"verhaal"]);
                [self.dagboekVerhalen setValue:uitkomst forKey:(NSString *)[NSNumber numberWithInt:situatieid]];
            }
        }
        [self.mapView removeAnnotations:self.keuzeAnnotations];
        [self hideCurrentMelding];
        [self.locationManager startUpdatingLocation];
        CLLocation *NULLocatie = [[CLLocation alloc]initWithLatitude:0 longitude:0];
        [self.targets replaceObjectAtIndex:situatieid-1 withObject:NULLocatie];
        NSLog(@"De targettteeeeen: %@", self.targets);
    }
    
    
}

- (void)tapOnAnnotation:(RMAnnotation *)annotation onMap:(RMMapView *)map {
    if(annotation.userInfo != NULL && ![annotation.title  isEqual: @"Situatie"]){
        //KEUZE AANGE'TAPPED'
        NSLog(@"[KEUZE AANGETAPPED]");
        if(self.popupView.superview){
            [self.popupView removeFromSuperview];
        }
        self.popupView = [[PopUpView alloc]initWithFrame:CGRectMake(1024, 768-670, 430, 670) andInfo:annotation.userInfo andType:@"keuze"];
        self.popupView.delegate = self;
        [self addSubview:self.popupView];
        [UIView animateWithDuration:0.5 animations:^{ self.popupView.frame = CGRectMake(1024-430, 768-670, 430, 670); }];
    }
}

- (void)dagboekButtonTapped:(id)sender
{
    [self.delegate dagboekButtonTapped];
}



@end
