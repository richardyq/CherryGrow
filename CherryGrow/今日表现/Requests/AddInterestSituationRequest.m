//
//  AddInterestSituationRequest.m
//  CherryGrow
//
//  Created by YinQ on 2018/11/26.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "AddInterestSituationRequest.h"
#import "InterestSituation.h"

@interface InterestSituationParam : NSObject

@property (nonatomic, assign) NSInteger cateId;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString* userId;
@property (nonatomic, strong) NSString* date;

@end

@implementation InterestSituationParam

@end

@implementation AddInterestSituationRequest
@synthesize paramDictionary = _paramDictionary;

- (id) initWithCateId:(NSInteger) cateId status:(NSInteger) status{
    self = [super init];
    if (self) {
        InterestSituationParam* param = [InterestSituationParam new];
        param.cateId = cateId;
        param.status = status;
        param.userId = [UserDefaults shareInstance].loginedUserId;
        param.date = [[NSDate date] stringWithFormat:@"yyyy-MM-dd"];
        
        _paramDictionary = [param mj_keyValues];
        [_paramDictionary setValue:@([UserDefaults shareInstance].kidId) forKey:@"kidId"];
    }
    return self;
}

- (NSString*) postUrl{
    return [HttpRequestUrlUtil requestUrl:@"situationService" method:@"addInsertstSituation"];
    
}

- (id) parserResult:(id) result{
    
    if([result isKindOfClass:[NSDictionary class]]){
        //InterestSituation
        NSDictionary* dict = (NSDictionary*) result;
        InterestSituation* model = [InterestSituation mj_objectWithKeyValues:dict];
        
        return model;
    }
    return result;
}
@end
