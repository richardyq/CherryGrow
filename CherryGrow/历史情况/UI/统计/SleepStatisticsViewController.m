//
//  SleepStatisticsViewController.m
//  CherryGrow
//
//  Created by YinQ on 2018/12/18.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "SleepStatisticsViewController.h"
#import "SleepStatisticsDetModel.h"
#import "HistoryRequestManager.h"
#import "SleepStatisticsTableViewCell.h"

@interface SleepStatisticsViewController ()

@end

@interface SleepStatisticsTableViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray<SleepStatisticsDetModel*>* statisticsModels;

@end

@implementation SleepStatisticsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"睡觉";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (Class) tableControllerClass{
    Class tableControllerClass = [SleepStatisticsTableViewController class];
    return tableControllerClass;
}
@end



@implementation SleepStatisticsTableViewController

- (void) viewDidLoad{
    [super viewDidLoad];
    [self startLoadSleepStatistics];
    [self.tableView setBackgroundColor:[UIColor commonBackgroundColor]];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.tableView registerClass:[SleepStatisticsTableViewCell class] forCellReuseIdentifier:@"SleepStatisticsTableViewCell"];
}

- (void) startLoadSleepStatistics{
    __weak typeof(self) weakSelf = self;
    [HistoryRequestManager createSleepStatisticsRequest:^(id result) {
        if (!weakSelf) {
            return ;
        }
        __strong typeof(self) strongSelf = weakSelf;
        strongSelf.statisticsModels = (NSMutableArray<SleepStatisticsDetModel*>*) result;
    } failed:^(NSInteger errorCode, NSString *message) {
        [NSObject showAlert:message];
    } complete:^(NSInteger errorCode) {
        if (!weakSelf) {
            return ;
        }
        __strong typeof(self) strongSelf = weakSelf;
        if (errorCode == 0) {
            [strongSelf.tableView reloadData];
        }
    }];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.statisticsModels.count;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SleepStatisticsTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"SleepStatisticsTableViewCell"];
    
    [cell setSleepStatisticsDetModel:self.statisticsModels[indexPath.row]];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.5;
}

- (NSMutableArray<SleepStatisticsDetModel*>*) statisticsModels{
    if (!_statisticsModels) {
        _statisticsModels = [NSMutableArray<SleepStatisticsDetModel*> array];
    }
    return _statisticsModels;
}
@end
