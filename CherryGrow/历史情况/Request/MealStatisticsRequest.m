//
//  MealStatisticsRequest.m
//  CherryGrow
//
//  Created by YinQ on 2018/12/18.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "MealStatisticsRequest.h"
#import "HistoryRecordsRequest.h"
#import "MealStatisticsDetModel.h"


@implementation MealStatisticsRequest
@synthesize paramDictionary = _paramDictionary;

- (instancetype)init
{
    self = [super init];
    if (self) {
        HistoryRecordsRequestParam* requestParam = [HistoryRecordsRequestParam new];
        
        requestParam.kidId = [UserDefaults shareInstance].kidId;
        _paramDictionary = [requestParam mj_keyValues];
    }
    return self;
}

- (NSString*) postUrl{
    return [HttpRequestUrlUtil requestUrl:@"historyService" method:@"mealStatistics"];
}

- (id) parserResult:(id) result{
    
    if([result isKindOfClass:[NSArray class]]){
        
        NSArray<NSDictionary*>* array = (NSArray<NSDictionary*>*) result;
        NSMutableArray* list = [NSMutableArray<MealStatisticsDetModel*> array];
        [array enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull dict, NSUInteger idx, BOOL * _Nonnull stop) {
            MealStatisticsDetModel* detModel = [MealStatisticsDetModel mj_objectWithKeyValues:dict];
            [list addObject:detModel];
        }];
        
        return list;
    }
    return result;
}
@end
