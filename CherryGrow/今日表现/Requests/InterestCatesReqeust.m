//
//  InterestCatesReqeust.m
//  CherryGrow
//
//  Created by YinQ on 2018/11/21.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "InterestCatesReqeust.h"
#import "InterestCateModel.h"

@implementation InterestCatesReqeust

- (NSString*) postUrl{
    return [HttpRequestUrlUtil requestUrl:@"situationService" method:@"getAllInterestList"];
    
}

- (id) parserResult:(id) result{
    
    if([result isKindOfClass:[NSArray class]]){
        
        NSArray<NSDictionary*>* dicts = (NSArray<NSDictionary*>*) result;
        NSMutableArray<InterestCateModel*>* cates = [NSMutableArray<InterestCateModel*> array];
        [dicts enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull dict, NSUInteger idx, BOOL * _Nonnull stop) {
            InterestCateModel* model = [InterestCateModel mj_objectWithKeyValues:dict];
            [cates addObject:model];
        }];
        return cates;
    }
    return result;
}
@end
