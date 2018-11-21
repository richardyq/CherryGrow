//
//  AddMealSituationRequest.h
//  CherryGrow
//
//  Created by YinQ on 2018/11/19.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "CDJsonRequest.h"
#import "MealSituation.h"

@interface AddMealSituationRequest : CDJsonRequest

- (id) initWithMealSituation:(MealSituationParam*) situation;

@end
