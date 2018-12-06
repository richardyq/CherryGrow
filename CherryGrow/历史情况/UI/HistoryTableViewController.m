//
//  HistoryTableViewController.m
//  CherryGrow
//
//  Created by YinQ on 2018/11/26.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "HistoryTableViewController.h"
#import "HistoryRequestManager.h"
#import "DailySituationModel.h"
#import "HistorySituationDetTableViewCell.h"

@interface DailySituationModel (HistoryTableCell)

- (NSInteger) detCount;
- (SituationHistoryDetModel*) modelInIndex:(NSInteger) index;
@end

@implementation DailySituationModel (HistoryTableCell)
- (NSInteger) detCount{
    return (self.mealSituationModels.count + self.sleepSituationModels.count + self.interestSituationModels.count);
}

- (SituationHistoryDetModel*) modelInIndex:(NSInteger) index{
    SituationHistoryDetModel* detModel = nil;
    if (index >=0 && index < self.mealSituationModels.count) {
        detModel = self.mealSituationModels[index];
        return detModel;
    }
    
    else if (index < (self.mealSituationModels.count + self.sleepSituationModels.count)) {
        detModel = self.sleepSituationModels[index - self.mealSituationModels.count];
        return detModel;
    }
    
    else if (index < [self detCount]) {
        NSInteger detIndex = index - (self.mealSituationModels.count + self.sleepSituationModels.count);
        detModel = self.interestSituationModels[detIndex];
        return detModel;
    }
    
    return detModel;
}
@end

@interface HistoryTableViewController ()

@property (nonatomic, strong) NSMutableArray<DailySituationModel*>* historyModels;
@property (nonatomic, assign) NSInteger totalCount;
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, strong) NSString* startDate;
@property (nonatomic, strong) NSString* endDate;

@end

@implementation HistoryTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self startLoadRecords];
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    
    [self.tableView registerClass:[HistorySituationDetTableViewCell class] forCellReuseIdentifier:@"HistorySituationDetTableViewCell"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) startLoadRecords{
    _type = 0;
    _startDate = nil;
    _endDate = nil;
    __weak typeof(self) weakSelf = self;
    [HistoryRequestManager createHistoryRecordRequest:0 startRow:0 rows:20 startDate:nil endDate:nil success:^(id result) {
        if (!weakSelf) {
            return ;
        }
        __strong typeof(self) strongSelf = weakSelf;
        if ([result isKindOfClass:[SituationHistoryRetModel class]]) {
            SituationHistoryRetModel* retModel = (SituationHistoryRetModel*) result;
            [strongSelf historyModelsLoaded:retModel.list];
            strongSelf.totalCount = retModel.count;
        }
        
    } failed:^(NSInteger errorCode, NSString *message) {
        [NSObject showAlert:message];
    } complete:^(NSInteger errorCode) {
        if (!weakSelf) {
            return ;
        }
        __strong typeof(self) strongSelf = weakSelf;
        [strongSelf.tableView reloadData];
        [strongSelf refreshFooter];
    }];
}

- (void) startLoadHistory:(NSInteger) type startDate:(NSString*) startDate endDate:(NSString*) endDate{
    __weak typeof(self) weakSelf = self;
    _type = type;
    _startDate = startDate;
    _endDate = endDate;
    [HistoryRequestManager createHistoryRecordRequest:type startRow:0 rows:20 startDate:startDate endDate:endDate success:^(id result) {
        if (!weakSelf) {
            return ;
        }
        __strong typeof(self) strongSelf = weakSelf;
        if ([result isKindOfClass:[SituationHistoryRetModel class]]) {
            SituationHistoryRetModel* retModel = (SituationHistoryRetModel*) result;
            [strongSelf historyModelsLoaded:retModel.list];
            strongSelf.totalCount = retModel.count;
        }
        
    } failed:^(NSInteger errorCode, NSString *message) {
        [NSObject showAlert:message];
    } complete:^(NSInteger errorCode) {
        if (!weakSelf) {
            return ;
        }
        __strong typeof(self) strongSelf = weakSelf;
        [strongSelf.tableView reloadData];
        [strongSelf refreshFooter];
    }];
}

- (void) startLoadMoreHistory{
    __weak typeof(self) weakSelf = self;

    [HistoryRequestManager createHistoryRecordRequest:self.type startRow:self.historyModels.count rows:20 startDate:self.startDate endDate:self.endDate success:^(id result) {
        if (!weakSelf) {
            return ;
        }
        __strong typeof(self) strongSelf = weakSelf;
        if ([result isKindOfClass:[SituationHistoryRetModel class]]) {
            SituationHistoryRetModel* retModel = (SituationHistoryRetModel*) result;
            [strongSelf moreHistoryModelsLoaded:retModel.list];
            strongSelf.totalCount = retModel.count;
        }
        
    } failed:^(NSInteger errorCode, NSString *message) {
        [NSObject showAlert:message];
    } complete:^(NSInteger errorCode) {
        if (!weakSelf) {
            return ;
        }
        __strong typeof(self) strongSelf = weakSelf;
        [strongSelf.tableView reloadData];
        [strongSelf refreshFooter];
    }];
}

- (void) historyModelsLoaded:(NSArray<DailySituationModel*>*) models{
    self.historyModels = [NSMutableArray<DailySituationModel*> arrayWithArray:models];
}

- (void) moreHistoryModelsLoaded:(NSArray<DailySituationModel*>*) models{
    //historyModelsLoaded
    [self.historyModels addObjectsFromArray:models];
}

- (void) refreshFooter{
    
    if (self.historyModels.count >= self.totalCount) {
        if (self.tableView.mj_footer) {
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
        }
    }
    else{
        if (self.tableView.mj_footer) {
            [self.tableView.mj_footer endRefreshing];
            
        }
        self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(startLoadMoreHistory)];
    }
}

#pragma mark - settingAndGetting
- (NSMutableArray<DailySituationModel*>*) historyModels{
    if (!_historyModels) {
        _historyModels = [NSMutableArray<DailySituationModel*> array];
    }
    return _historyModels;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    if (self.historyModels) {
        return self.historyModels.count;
    }
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    if (self.historyModels) {
        DailySituationModel* model = self.historyModels[section];
        return [model detCount];
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HistorySituationDetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HistorySituationDetTableViewCell"];
    DailySituationModel* model = self.historyModels[indexPath.section];
    SituationHistoryDetModel* detModel = [model modelInIndex:indexPath.row];
    [cell setSituationHistoryDet:detModel];
    // Configure the cell...
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.5;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 41;
}

- (UIView*) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView* headerview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 41)];
    headerview.backgroundColor = [UIColor commonBackgroundColor];
    [headerview showBoarder:UIViewBorderLineTypeBottom];
    
    UILabel* dateLabel = [headerview addLabel];
    dateLabel.textColor = [UIColor commonTextColor];
    dateLabel.font = [UIFont systemFontOfSize:14];
    
    [dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(headerview);
        make.left.equalTo(headerview).offset(15);
    }];
    
    dateLabel.text = self.historyModels[section].date;
    
    return headerview;
}

@end
