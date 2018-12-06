//
//  HistoryTableViewController.h
//  CherryGrow
//
//  Created by YinQ on 2018/11/26.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HistoryTableViewController : UITableViewController

- (void) startLoadRecords;

- (void) startLoadHistory:(NSInteger) type startDate:(NSString*) startDate endDate:(NSString*) endDate;

@end
