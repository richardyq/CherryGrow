//
//  StatisticsPageManager.m
//  CherryGrow
//
//  Created by YinQ on 2018/12/17.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "StatisticsPageManager.h"
#import "StatisticStartViewController.h"

@implementation StatisticsPageManager

+ (void) entryStaticsticStartPage{
    StatisticStartViewController* startViewController = [[StatisticStartViewController alloc] initWithNibName:nil bundle:nil];
    [[PageViewControllerManager defaultManager] createPageController:startViewController];
}
@end
