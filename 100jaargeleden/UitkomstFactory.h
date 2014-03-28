//
//  UitkomstFactory.h
//  100jaargeleden
//
//  Created by Sven Lombaert on 28/03/14.
//  Copyright (c) 2014 Sven Lombaert. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UitkomstData.h"

@interface UitkomstFactory : NSObject
+(UitkomstData *)createKeuzeWithDictionary:(NSDictionary *)dictionary;
@end
