//
//  AddSleepSituationRequest.m
//  CherryGrow
//
//  Created by YinQ on 2018/11/20.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "AddSleepSituationRequest.h"


@implementation AddSleepSituationRequest

@synthesize paramDictionary = _paramDictionary;

- (id) initWithSleepSituation:(SleepSituationParam*) situation{
    self = [super init];
    if(self){
        
        NSMutableDictionary* postParam = [situation mj_keyValues];
        [postParam setValue:@([UserDefaults shareInstance].kidId) forKey:@"kidId"];
        _paramDictionary = postParam;
    }
    return self;
}

- (NSString*) postUrl{
    return [HttpRequestUrlUtil requestUrl:@"situationService" method:@"addSleepSituation"];
    
}

- (id) parserResult:(id) result{
    
    if([result isKindOfClass:[NSDictionary class]]){
        
        NSDictionary* dict = (NSDictionary*) result;
        SleepSituation* model = [SleepSituation mj_objectWithKeyValues:dict];
        return model;
    }
    return result;
}

@end
