//
//  SleepSituationEditTableViewCell.h
//  CherryGrow
//
//  Created by YinQ on 2018/11/20.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SleepSituation.h"

@protocol SleepSituationEditDelegate <NSObject>

@required
- (void) submitSleepSituation:(SleepSituation*) situation;

@end

@interface SleepSituationEditTableViewCell : UITableViewCell

@property (nonatomic, weak) id<SleepSituationEditDelegate> delegate;


- (id) initWithSituation:(SleepSituation*) situation;
@end
