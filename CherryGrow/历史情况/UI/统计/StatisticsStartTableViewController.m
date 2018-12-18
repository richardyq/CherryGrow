//
//  StatisticsStartTableViewController.m
//  CherryGrow
//
//  Created by YinQ on 2018/12/17.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "StatisticsStartTableViewController.h"
#import "HistoryRequestManager.h"
#import "StatisticsModel.h"
#import "StatisticsStartTableViewCell.h"
#import "StatisticsPageManager.h"

@interface StatisticsStartTableViewController ()

@property (nonatomic, strong) StatisticsModel* mealStatisticModel;
@property (nonatomic, strong) StatisticsModel* sleepStatisticModel;
@property (nonatomic, strong) StatisticsModel* interestStatisticModel;

@end

@implementation StatisticsStartTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[StatisticsStartTableViewCell class] forCellReuseIdentifier:@"StatisticsStartTableViewCell"];
    [self startLoadMealStatistic];
    
    [self.tableView setBackgroundColor:[UIColor commonBackgroundColor]];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    StatisticsStartTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StatisticsStartTableViewCell"];
    
    switch (indexPath.row) {
        case 0:
        {
            [cell setTitle:@"吃饭"];
            [cell setStatistcsModel:self.mealStatisticModel];
            break;
        }
        case 1:
        {
            [cell setTitle:@"睡觉"];
            [cell setStatistcsModel:self.sleepStatisticModel];
            break;
        }
        case 2:
        {
            [cell setTitle:@"兴趣学习"];
            [cell setStatistcsModel:self.interestStatisticModel];
            break;
        }
        default:
            break;
    }
     
    // Configure the cell...
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.5;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:{
            [StatisticsPageManager entryMealStatisticsPage:self.mealStatisticModel];
            break;
        }
        case 1:{
            [StatisticsPageManager entrySleepStatisticsPage:self.sleepStatisticModel];
            break;
        }
        case 2:{
            [StatisticsPageManager entryInterestStatisticsPage:self.interestStatisticModel];
            break;
        }
        default:
            break;
    }
}

- (void) startLoadMealStatistic{
    [SVProgressHUD showWithStatus:@"获取数据"];
    __weak typeof(self) weakSelf = self;
    [HistoryRequestManager createTotalStatisticsRequest:1 success:^(id result) {
        if (!weakSelf) {
            return ;
        }
        __strong typeof(self) strongSelf = weakSelf;
        [strongSelf setMealStatisticModel:(StatisticsModel*) result];
    } failed:^(NSInteger errorCode, NSString *message) {
        [NSObject showAlert:message];
        [SVProgressHUD dismiss];
    } complete:^(NSInteger errorCode) {
        if (errorCode == 0) {
            if (!weakSelf) {
                return ;
            }
            __strong typeof(self) strongSelf = weakSelf;
            [strongSelf startLoadSleepStatistic];
        }
    }];
}

- (void) startLoadSleepStatistic{
    [SVProgressHUD showWithStatus:@"获取数据"];
    __weak typeof(self) weakSelf = self;
    [HistoryRequestManager createTotalStatisticsRequest:2 success:^(id result) {
        if (!weakSelf) {
            return ;
        }
        __strong typeof(self) strongSelf = weakSelf;
        [strongSelf setSleepStatisticModel:(StatisticsModel*) result];
    } failed:^(NSInteger errorCode, NSString *message) {
        [NSObject showAlert:message];
        [SVProgressHUD dismiss];
    } complete:^(NSInteger errorCode) {
        if (errorCode == 0) {
            if (!weakSelf) {
                return ;
            }
            __strong typeof(self) strongSelf = weakSelf;
            [strongSelf startLoadInterestStatistic];
        }
    }];
}

- (void) startLoadInterestStatistic{
    [SVProgressHUD showWithStatus:@"获取数据"];
    __weak typeof(self) weakSelf = self;
    [HistoryRequestManager createTotalStatisticsRequest:3 success:^(id result) {
        if (!weakSelf) {
            return ;
        }
        __strong typeof(self) strongSelf = weakSelf;
        [strongSelf setInterestStatisticModel:(StatisticsModel*) result];
    } failed:^(NSInteger errorCode, NSString *message) {
        [NSObject showAlert:message];
        
    } complete:^(NSInteger errorCode) {
        [SVProgressHUD dismiss];
        if (errorCode == 0) {
            if (!weakSelf) {
                return ;
            }
            __strong typeof(self) strongSelf = weakSelf;
            [strongSelf.tableView reloadData];
        }
    }];
}

@end
