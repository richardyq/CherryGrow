//
//  TodayMealSituationListRequest.m
//  CherryGrow
//
//  Created by YinQ on 2018/11/19.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "TodayMealSituationListRequest.h"
#import "MealSituation.h"
#import "UserDefaults.h"

@implementation TodayMealSituationListRequest
@synthesize paramDictionary = _paramDictionary;

- (id) init{
    self = [super init];
    if (self) {
        NSMutableDictionary* postParam = [NSMutableDictionary dictionary];
        [postParam setValue:@([UserDefaults shareInstance].kidId) forKey:@"id"];
        _paramDictionary = postParam;
    }
    return self;
}

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
