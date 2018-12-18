//
//  MealStatisticsViewController.m
//  CherryGrow
//
//  Created by YinQ on 2018/12/18.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "MealStatisticsViewController.h"
#import "HistoryRequestManager.h"
#import "MealStatisticsDetModel.h"
#import "MealStatisticsTableViewCell.h"

@interface MealStatisticsTableViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray<MealStatisticsDetModel*>* statisticsModels;
@end

@interface MealStatisticsViewController ()

@end

@implementation MealStatisticsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"吃饭";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (Class) tableControllerClass{
    Class tableControllerClass = [MealStatisticsTableViewController class];
    return tableControllerClass;
}

@end



@implementation MealStatisticsTableViewController

- (void) viewDidLoad{
    [super viewDidLoad];
    
    [self startLoadMealStatistics];
    [self.tableView registerClass:[MealStatisticsTableViewCell class] forCellReuseIdentifier:@"MealStatisticsTableViewCell"];
    
    [self.tableView setBackgroundColor:[UIColor commonBackgroundColor]];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.statisticsModels.count;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MealStatisticsTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"MealStatisticsTableViewCell"];
    MealStatisticsDetModel* detModel = self.statisticsModels[indexPath.row];
    [cell setMealStatisticsDetModel:detModel];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void) startLoadMealStatistics{
    __weak typeof(self) weakSelf = self;
    [HistoryRequestManager createMealStatisticsRequest:^(id result) {
        if (!weakSelf) {
            return ;
        }
        __strong typeof(self) strongSelf = weakSelf;
        NSMutableArray<MealStatisticsDetModel*>* models = (NSMutableArray<MealStatisticsDetModel*>*) result;
        [strongSelf setStatisticsModels:models];
        
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

- (NSMutableArray<MealStatisticsDetModel*>*) statisticsModels{
    if (!_statisticsModels) {
        _statisticsModels = [NSMutableArray<MealStatisticsDetModel*> array];
    }
    return _statisticsModels;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.5;
}
@end
