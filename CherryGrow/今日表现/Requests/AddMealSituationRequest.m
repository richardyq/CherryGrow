//
//  AddMealSituationRequest.m
//  CherryGrow
//
//  Created by YinQ on 2018/11/19.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "AddMealSituationRequest.h"

@implementation AddMealSituationRequest

@synthesize paramDictionary = _paramDictionary;

- (id) initWithMealSituation:(MealSituation*) situation{
    self = [super init];
    if(self){
        
        NSMutableDictionary* postParam = [situation mj_keyValues];
        
        _paramDictionary = postParam;
    }
    return self;
}

- (NSString*) postUrl{
    return [HttpRequestUrlUtil requestUrl:@"situationService" method:@"addMealSituation"];
    
}

- (id) parserResult:(id) result{
    
    if([result isKindOfClass:[NSDictionary class]]){
        
        NSDictionary* dict = (NSDictionary*) result;
        MealSituation* model = [MealSituation mj_objectWithKeyValues:dict];
        return model;
    }
    return result;
}
@end
