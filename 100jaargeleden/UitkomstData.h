//
//  UitkomstData.h
//  100jaargeleden
//
//  Created by Sven Lombaert on 28/03/14.
//  Copyright (c) 2014 Sven Lombaert. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UitkomstData : NSObject
@property (nonatomic) int uitkomstID;
@property (nonatomic) int keuzeID;
@property (nonatomic, strong) NSString *verhaal;
@property (nonatomic, strong) NSString *fotoPath;
@property (nonatomic, strong) NSString *informatie;
@property (nonatomic, strong) NSString *informatiepath;
@end
