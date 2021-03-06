//
//  TodayInterestSituationsRequest.m
//  CherryGrow
//
//  Created by YinQ on 2018/11/26.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "TodayInterestSituationsRequest.h"
#import "InterestSituation.h"

@implementation TodayInterestSituationsRequest
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
    return [HttpRequestUrlUtil requestUrl:@"situationService" method:@"todayInterestSituation"];
    
}

- (id) parserResult:(id) result{
    
    if([result isKindOfClass:[NSArray class]]){
        
        NSArray<NSDictionary*>* dicts = (NSArray<NSDictionary*>*) result;
        NSMutableArray<InterestSituation*>* situations = [NSMutableArray<InterestSituation*> array];
        [dicts enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull dict, NSUInteger idx, BOOL * _Nonnull stop) {
            InterestSituation* model = [InterestSituation mj_objectWithKeyValues:dict];
            [situations addObject:model];
        }];
        return situations;
    }
    return result;
}

@end
