//
//  SleepStatisticsDetModel.h
//  CherryGrow
//
//  Created by YinQ on 2018/12/18.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "StatisticsDetModel.h"

@interface SleepStatisticsDetModel : StatisticsDetModel

@property (nonatomic, assign) NSInteger noonEarlyCount;
@property (nonatomic, assign) NSInteger noonNormalCount;
@property (nonatomic, assign) NSInteger noonLateCount;

@property (nonatomic, assign) NSInteger eveningEarlyCount;
@property (nonatomic, assign) NSInteger eveningNormalCount;
@property (nonatomic, assign) NSInteger eveningLateCount;

@end
