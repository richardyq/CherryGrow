//
//  TotalStatisticsRequest.m
//  CherryGrow
//
//  Created by YinQ on 2018/12/17.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "TotalStatisticsRequest.h"
#import "HistoryRecordsRequest.h"
#import "StatisticsModel.h"

@implementation TotalStatisticsRequest
@synthesize paramDictionary = _paramDictionary;

- (id) initWithType:(NSInteger) type{
    self = [super init];
    if (self) {
        HistoryRecordsRequestParam* requestParam = [HistoryRecordsRequestParam new];
        requestParam.type = type;
        requestParam.kidId = [UserDefaults shareInstance].kidId;
        _paramDictionary = [requestParam mj_keyValues];
    }
    return self;
}

- (NSString*) postUrl{
    return [HttpRequestUrlUtil requestUrl:@"historyService" method:@"statistics"];
}

- (id) parserResult:(id) result{
    
    if([result isKindOfClass:[NSDictionary class]]){
        
        NSDictionary* dict = (NSDictionary*) result;
        StatisticsModel* model = [StatisticsModel mj_objectWithKeyValues:dict];
        return model;
    }
    return result;
}
@end
