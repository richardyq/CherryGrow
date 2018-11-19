//
//  TodayMealSituationListRequest.m
//  CherryGrow
//
//  Created by YinQ on 2018/11/19.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "TodayMealSituationListRequest.h"
#import "MealSituation.h"

@implementation TodayMealSituationListRequest

- (NSString*) postUrl{
    return [HttpRequestUrlUtil requestUrl:@"situationService" method:@"todayMealSituation"];
    
}

- (id) parserResult:(id) result{
    
    if([result isKindOfClass:[NSArray class]]){

        NSArray<NSDictionary*>* dicts = (NSArray<NSDictionary*>*) result;
        NSMutableArray<MealSituation*>* situations = [NSMutableArray<MealSituation*> array];
        [dicts enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull dict, NSUInteger idx, BOOL * _Nonnull stop) {
            MealSituation* model = [MealSituation mj_objectWithKeyValues:dict];
            [situations addObject:model];
        }];
        return situations;
    }
    return result;
}
@end
