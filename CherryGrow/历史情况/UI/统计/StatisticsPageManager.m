//
//  StatisticsPageManager.m
//  CherryGrow
//
//  Created by YinQ on 2018/12/17.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "StatisticsPageManager.h"
#import "StatisticStartViewController.h"
#import "StatisticsModel.h"

#import "MealStatisticsViewController.h"
#import "SleepStatisticsViewController.h"
#import "InterestStatisticViewController.h"

@implementation StatisticsPageManager

+ (void) entryStaticsticStartPage{
    StatisticStartViewController* startViewController = [[StatisticStartViewController alloc] initWithNibName:nil bundle:nil];
    [[PageViewControllerManager defaultManager] createPageController:startViewController];
}

+ (void) entryMealStatisticsPage:(StatisticsModel*) statisticsModel{
    StatisticsViewController* viewController = [[MealStatisticsViewController alloc] initWithStatistics:statisticsModel];
    [[PageViewControllerManager defaultManager] createPageController:viewController];
}

+ (void) entrySleepStatisticsPage:(StatisticsModel*) statisticsModel{
    StatisticsViewController* viewController = [[SleepStatisticsViewController alloc] initWithStatistics:statisticsModel];
    [[PageViewControllerManager defaultManager] createPageController:viewController];
}

+ (void) entryInterestStatisticsPage:(StatisticsModel*) statisticsModel{
    StatisticsViewController* viewController = [[InterestStatisticViewController alloc] initWithStatistics:statisticsModel];
    [[PageViewControllerManager defaultManager] createPageController:viewController];
}
@end
