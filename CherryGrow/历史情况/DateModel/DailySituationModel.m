//
//  DailySituationModel.m
//  CherryGrow
//
//  Created by YinQ on 2018/11/26.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "DailySituationModel.h"

@implementation DailySituationModel

+ (NSDictionary *)objectClassInArray{
    return @{
             @"mealSituationModels" : @"MealHistoryDetModel",
             @"sleepSituationModels" : @"SleepHistoryDetModel",
             @"interestSituationModels" : @"InterestHistoryDetModel"
             };
}

@end

@implementation SituationHistoryRetModel

+ (NSDictionary *)objectClassInArray{
    return @{@"list" : @"DailySituationModel"};
}
@end
