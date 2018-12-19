//
//  InterestStatisticsRequest.m
//  CherryGrow
//
//  Created by YinQ on 2018/12/19.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "InterestStatisticsRequest.h"
#import "HistoryRecordsRequest.h"
#import "InterestStatisticsDetModel.h"

@implementation InterestStatisticsRequest

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
    return [HttpRequestUrlUtil requestUrl:@"historyService" method:@"interestStatistics"];
}

- (id) parserResult:(id) result{
    
    if([result isKindOfClass:[NSArray class]]){
        
        NSArray<NSDictionary*>* array = (NSArray<NSDictionary*>*) result;
        NSMutableArray* list = [NSMutableArray<InterestStatisticsDetModel*> array];
        [array enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull dict, NSUInteger idx, BOOL * _Nonnull stop) {
            InterestStatisticsDetModel* detModel = [InterestStatisticsDetModel mj_objectWithKeyValues:dict];
            [list addObject:detModel];
        }];
        
        return list;
    }
    return result;
}
@end
