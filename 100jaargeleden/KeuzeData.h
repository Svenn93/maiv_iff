//
//  KeuzeData.h
//  100jaargeleden
//
//  Created by Sven Lombaert on 28/03/14.
//  Copyright (c) 2014 Sven Lombaert. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeuzeData : NSObject
@property (nonatomic) int keuzeID;
@property (nonatomic) int situatieID;
@property (nonatomic, strong) NSString *verhaal;
@property (nonatomic, strong) NSString *fotoPath;
@property (nonatomic) double lat;
@property (nonatomic) double lon;
@end
