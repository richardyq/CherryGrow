//
//  HistoryRecordsRequest.m
//  CherryGrow
//
//  Created by YinQ on 2018/11/27.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "HistoryRecordsRequest.h"
#import "DailySituationModel.h"

@implementation HistoryRecordsRequestParam

@end;

@implementation HistoryRecordsRequest
@synthesize paramDictionary = _paramDictionary;

- (id) initWithType:(NSInteger) type
           startRow:(NSInteger) startRow
               rows:(NSInteger) rows
          startDate:(NSString*) startDate
            endDate:(NSString*) endDate{
    self = [super init];
    if (self) {
        HistoryRecordsRequestParam* requestParam = [HistoryRecordsRequestParam new];
        requestParam.type = type;
        requestParam.startRow = startRow;
        requestParam.rows = rows;
        requestParam.startDate = startDate;
        requestParam.endDate = endDate;
        
        requestParam.kidId = [UserDefaults shareInstance].kidId;
        _paramDictionary = [requestParam mj_keyValues];
    }
    return self;
}

- (NSString*) postUrl{
    return [HttpRequestUrlUtil requestUrl:@"historyService" method:@"recordList"];
}

- (id) parserResult:(id) result{
    
    if([result isKindOfClass:[NSDictionary class]]){
        
        NSDictionary* dict = (NSDictionary*) result;
        SituationHistoryRetModel* model = [SituationHistoryRetModel mj_objectWithKeyValues:dict];
        return model;
    }
    return result;
}
@end
