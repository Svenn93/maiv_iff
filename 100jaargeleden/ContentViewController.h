//
//  ContentViewController.h
//  100jaargeleden
//
//  Created by Sven Lombaert on 25/03/14.
//  Copyright (c) 2014 Sven Lombaert. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContentScrollView.h"
#import "MapView.h"
#import "DiaryView.h"

@interface ContentViewController : UIViewController <MapViewDelegate>


@property (nonatomic, strong) ContentScrollView *v;
@property (nonatomic, strong) MapView *mapv;
@property (nonatomic, strong) DiaryView *diaryv;
@end
