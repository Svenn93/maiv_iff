//
//  KeuzeFactory.m
//  100jaargeleden
//
//  Created by Sven Lombaert on 28/03/14.
//  Copyright (c) 2014 Sven Lombaert. All rights reserved.
//

#import "KeuzeFactory.h"

@implementation KeuzeFactory
+(KeuzeData *)createKeuzeWithDictionary:(NSDictionary *)dictionary
{
    KeuzeData *keuze = [[KeuzeData alloc]init];
    keuze.keuzeID = [[dictionary objectForKey:@"id"]intValue];
    keuze.situatieID = [[dictionary objectForKey:@"melding"]intValue];
    keuze.verhaal = [dictionary objectForKey:@"verhaal"];
    keuze.fotoPath = [dictionary objectForKey:@"fotopath"];
    keuze.lat = [[dictionary objectForKey:@"latitude"]doubleValue];
    keuze.lon = [[dictionary objectForKey:@"longitude"]doubleValue];
    return keuze;
}
@end
