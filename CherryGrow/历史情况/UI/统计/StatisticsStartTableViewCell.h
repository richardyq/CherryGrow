//
//  StatisticsStartTableViewCell.h
//  CherryGrow
//
//  Created by YinQ on 2018/12/17.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StatisticsModel.h"

@interface StatisticsStartTableViewCell : UITableViewCell

- (void) setTitle:(NSString*) title;
- (void) setStatistcsModel:(StatisticsModel*) model;
@end
