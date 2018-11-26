//
//  AddInterestSituationRequest.h
//  CherryGrow
//
//  Created by YinQ on 2018/11/26.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "CDJsonRequest.h"

@interface AddInterestSituationRequest : CDJsonRequest

- (id) initWithCateId:(NSInteger) cateId status:(NSInteger) status;

@end
