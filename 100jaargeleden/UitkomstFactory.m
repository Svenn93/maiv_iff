//
//  UitkomstFactory.m
//  100jaargeleden
//
//  Created by Sven Lombaert on 28/03/14.
//  Copyright (c) 2014 Sven Lombaert. All rights reserved.
//

#import "UitkomstFactory.h"

@implementation UitkomstFactory
+(UitkomstData *)createKeuzeWithDictionary:(NSDictionary *)dictionary
{
    UitkomstData *uitkomst = [[UitkomstData alloc]init];
    uitkomst.keuzeID = [[dictionary objectForKey:@"keuze"]intValue];
    uitkomst.uitkomstID = [[dictionary objectForKey:@"id"]intValue];
    uitkomst.verhaal = [dictionary objectForKey:@"verhaal"];
    uitkomst.fotoPath = [dictionary objectForKey:@"fotopath"];
    uitkomst.informatie = [dictionary objectForKey:@"informatie"];
    uitkomst.informatiepath = [dictionary objectForKey:@"informatiepath"];
    return uitkomst;
}
@end
