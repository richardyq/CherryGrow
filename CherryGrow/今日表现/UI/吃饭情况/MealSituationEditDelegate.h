//
//  MealSituationEditDelegate.h
//  CherryGrow
//
//  Created by YinQ on 2018/11/19.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MealSituation.h"

@protocol MealSituationEditDelegate <NSObject>

@required
- (void) submitMealSituation:(MealSituationParam*) situation;

@end
