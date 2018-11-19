//
//  MealSitatusEditTableViewCell.h
//  CherryGrow
//
//  Created by YinQ on 2018/10/26.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MealSituation.h"
#import "MealSituationEditDelegate.h"

@interface MealSitatusEditTableViewCell : UITableViewCell

@property (nonatomic, assign) NSInteger mealCode;
@property (nonatomic, weak) id<MealSituationEditDelegate> delegate;

- (id) initWithTitle:(NSString*) title;

- (id) initWithMealSituation:(MealSituation*) situation;

@end
