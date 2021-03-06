//
//  TodaySleepSituationListRequest.m
//  CherryGrow
//
//  Created by YinQ on 2018/11/20.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "TodaySleepSituationListRequest.h"
#import "SleepSituation.h"

@implementation TodaySleepSituationListRequest
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
    return [HttpRequestUrlUtil requestUrl:@"situationService" method:@"todaySleepSituation"];
    
}

- (id) parserResult:(id) result{
    
    if([result isKindOfClass:[NSArray class]]){
        
        NSArray<NSDictionary*>* dicts = (NSArray<NSDictionary*>*) result;
        NSMutableArray<SleepSituation*>* situations = [NSMutableArray<SleepSituation*> array];
        [dicts enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull dict, NSUInteger idx, BOOL * _Nonnull stop) {
            SleepSituation* model = [SleepSituation mj_objectWithKeyValues:dict];
            [situations addObject:model];
        }];
        return situations;
    }
    return result;
}
@end
