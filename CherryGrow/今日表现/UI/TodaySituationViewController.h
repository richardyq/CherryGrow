//
//  TodaySituationViewController.h
//  CherryGrow
//
//  Created by YinQ on 2018/12/4.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TodaySituationViewController : UIViewController

@property (nonatomic, readonly) NSDate* loadSituationTime;

- (void) todaySituationsLoaded;
- (void) todaySituationsLoadFailed;

@end
