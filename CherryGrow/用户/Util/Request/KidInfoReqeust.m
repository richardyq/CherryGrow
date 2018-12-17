//
//  KidInfoReqeust.m
//  CherryGrow
//
//  Created by YinQ on 2018/12/17.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "KidInfoReqeust.h"
#import "KidInfoModel.h"

@implementation KidInfoReqeust
@synthesize paramDictionary = _paramDictionary;

- (id) initWithKidId:(NSInteger) kidId{
    self = [super init];
    if(self){
        
        NSMutableDictionary* postParam = [NSMutableDictionary dictionary];
        [postParam setValue:@(kidId) forKey:@"id"];
        
        _paramDictionary = postParam;
    }
    return self;
}

- (NSString*) postUrl{
    return [HttpRequestUrlUtil requestUrl:@"userService" method:@"getKidInfo"];
}

- (id) parserResult:(id) result{
    if([result isKindOfClass:[NSDictionary class]]){
        NSDictionary* respDictionary = (NSDictionary*) result;
        KidInfoModel* model = [KidInfoModel mj_objectWithKeyValues:respDictionary];
        return model;
    }
    return result;
}
@end
