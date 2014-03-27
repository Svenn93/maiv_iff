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
        /*UIImage *image = [UIImage imageNamed:@"app_background"];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
        [self addSubview:imageView];*/
        
        NSString *stringPath = [[NSBundle mainBundle]pathForResource:@"ieper_straten" ofType:@"mbtiles"];
        NSURL *url = [NSURL fileURLWithPath:stringPath];
        RMMBTilesSource *tileSource = [[RMMBTilesSource alloc]initWithTileSetURL:url];
        
        NSLog(@"De tilesource: %@ met url %@ en stringPath: %@", tileSource, url, stringPath);
        CLLocationCoordinate2D centerPoint = CLLocationCoordinate2DMake(50.8844, 2.8875);
        self.mapView = [[RMMapView alloc] initWithFrame:CGRectMake(112, 134, 800, 500) andTilesource:tileSource centerCoordinate:centerPoint zoomLevel:14 maxZoomLevel:18 minZoomLevel:14 backgroundImage:nil];
        [self addSubview:self.mapView];
    }
    return self;
}
@end
