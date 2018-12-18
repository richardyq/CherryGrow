//
//  StatisticsPageManager.h
//  CherryGrow
//
//  Created by YinQ on 2018/12/17.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@class StatisticsModel;

@interface StatisticsPageManager : NSObject

+ (void) entryStaticsticStartPage;

+ (void) entryMealStatisticsPage:(StatisticsModel*) statisticsModel;
+ (void) entrySleepStatisticsPage:(StatisticsModel*) statisticsModel;
+ (void) entryInterestStatisticsPage:(StatisticsModel*) statisticsModel;

@end
