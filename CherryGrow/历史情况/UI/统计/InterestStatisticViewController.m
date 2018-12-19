//
//  InterestStatisticViewController.m
//  CherryGrow
//
//  Created by YinQ on 2018/12/18.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "InterestStatisticViewController.h"
#import "HistoryRequestManager.h"
#import "InterestStatisticsDetModel.h"
#import "InterestStatisticsTableViewCell.h"

@interface InterestStatisticViewController ()


@end

@interface InterestStatisticTableViewController : UITableViewController
@property (nonatomic, strong) NSMutableArray<InterestStatisticsDetModel*>* statisticsModels;
@end

@implementation InterestStatisticViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"兴趣学习";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (Class) tableControllerClass{
    Class tableControllerClass = [InterestStatisticTableViewController class];
    return tableControllerClass;
}
@end

@implementation InterestStatisticTableViewController

- (void) viewDidLoad{
    [super viewDidLoad];
    [self.tableView setBackgroundColor:[UIColor commonBackgroundColor]];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    [self.tableView registerClass:[InterestStatisticsTableViewCell class] forCellReuseIdentifier:@"InterestStatisticsTableViewCell"];
    
    //[self startLoadInterestStatistics];
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(startLoadInterestStatistics)];
    header.lastUpdatedTimeLabel.hidden = YES;
    self.tableView.mj_header = header;
    [self.tableView.mj_header beginRefreshing];
}

- (void) startLoadInterestStatistics{
    __weak typeof(self) weakSelf = self;
    [HistoryRequestManager createInterestStatisticsRequest:^(id result) {
        if (!weakSelf) {
            return ;
        }
        __strong typeof(self) strongSelf = weakSelf;
        [strongSelf setStatisticsModels:(NSMutableArray<InterestStatisticsDetModel *> *) result];
    } failed:^(NSInteger errorCode, NSString *message) {
        [NSObject showAlert:message];
        
    } complete:^(NSInteger errorCode) {
        if (!weakSelf) {
            return ;
        }
        __strong typeof(self) strongSelf = weakSelf;
        [strongSelf.tableView.mj_header endRefreshing];
        if (errorCode == 0) {
            [strongSelf.tableView reloadData];
        }
    }];
    
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return self.statisticsModels.count;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    InterestStatisticsDetModel* detModel = self.statisticsModels[section];
    
    return detModel.detModels.count;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    InterestStatisticsTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"InterestStatisticsTableViewCell"];
    InterestStatisticsDetModel* detModel = self.statisticsModels[indexPath.section];
    InterestStatisticsItemModel* itemModel = detModel.detModels[indexPath.row];
    
    [cell setInterestStatisticsItem:itemModel];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (UIView*) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView* headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
    headerView.backgroundColor = [UIColor whiteColor];
    [headerView showBoarder:UIViewBorderLineTypeBottom];
    
    UILabel* monthLabel = [headerView addLabel];
    monthLabel.font = [UIFont systemFontOfSize:13];
    monthLabel.textColor = [UIColor mainThemeColor];
    [monthLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(headerView);
        make.left.equalTo(headerView).offset(13);
    }];
    
    UILabel* statisticsLabel = [headerView addLabel];
    statisticsLabel.font = [UIFont systemFontOfSize:13];
    statisticsLabel.textColor = [UIColor commonTextColor];
    [statisticsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(headerView);
        make.right.equalTo(headerView).offset(-13);
    }];
    
    InterestStatisticsDetModel* detModel = self.statisticsModels[section];
    monthLabel.text = detModel.month;
    
    NSString* countString = [NSString stringWithFormat:@" %ld", detModel.count];
    NSString* scoreString = [NSString stringWithFormat:@" %.2f", detModel.score];
    NSString* statisticsString = [NSString stringWithFormat:@"记录: %@   得分: %@", countString, scoreString];
    NSRange countRange = [statisticsString rangeOfString:countString];
    NSRange scoreRange = [statisticsString rangeOfString:scoreString];
    NSMutableAttributedString* attrString = [[NSMutableAttributedString alloc] initWithString:statisticsString];
    [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor mainThemeColor] range:countRange];
    [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor mainThemeColor] range:scoreRange];
    [statisticsLabel setAttributedText:attrString];
    return headerView;
}

- (NSMutableArray<InterestStatisticsDetModel*>*) statisticsModels{
    if (!_statisticsModels) {
        _statisticsModels = [NSMutableArray<InterestStatisticsDetModel*> array];
    }
    return _statisticsModels;
}


@end

