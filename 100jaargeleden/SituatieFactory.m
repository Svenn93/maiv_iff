//
//  SituatieFactory.m
//  100jaargeleden
//
//  Created by Sven Lombaert on 28/03/14.
//  Copyright (c) 2014 Sven Lombaert. All rights reserved.
//

#import "SituatieFactory.h"

@implementation SituatieFactory
+(SituatieData *)createSituatieWithDictionary:(NSDictionary *)dictionary
{
    SituatieData *situatie = [[SituatieData alloc]init];
    situatie.verhaal = [dictionary objectForKey:@"verhaal"];
    situatie.fotoPath = [dictionary objectForKey:@"fotopath"];
    situatie.lat = [[dictionary objectForKey:@"latitude"]doubleValue];
    situatie.lon = [[dictionary objectForKey:@"longitude"]doubleValue];
    return situatie;
}
@end
