//
//  SleepSituationStartViewController.m
//  CherryGrow
//
//  Created by YinQ on 2018/10/25.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "SleepSituationStartViewController.h"
#import "SleepSituationEditTableViewCell.h"
#import "SituationRequestManager.h"

@interface SleepSituationStartViewController ()
<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView* tableView;

@property (nonatomic, strong) NSMutableArray<SleepSituation*>* sleepSituations;

@end

@implementation SleepSituationStartViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"睡眠情况";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tableView registerClass:[SleepSituationEditTableViewCell class] forCellReuseIdentifier:@"SleepSituationEditTableViewCell"];
    
    [self layoutElements];
    
    [self loadSleepSituations];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
}

- (void) layoutElements{
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void) loadSleepSituations{
    __weak typeof(self) weakSelf = self;
    [SituationRequestManager createTodaySleepSituationRequst:^(id result) {
        if (!weakSelf) {
            return ;
        }
        __strong typeof(self) strongSelf = weakSelf;
        NSArray<SleepSituation*>* situations = (NSArray<SleepSituation*>*) result;
        [strongSelf sleepSituationListLoaded:situations];
    } failed:^(NSInteger errorCode, NSString *message) {
        
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

- (void) sleepSituationListLoaded:(NSArray<SleepSituation*>*) situations{
    [situations enumerateObjectsUsingBlock:^(SleepSituation * _Nonnull sleepSituation, NSUInteger i, BOOL * _Nonnull stop) {
        [self.sleepSituations enumerateObjectsUsingBlock:^(SleepSituation * _Nonnull situation, NSUInteger idx, BOOL * _Nonnull stop) {
            if (situation.code == sleepSituation.code) {
                [self.sleepSituations replaceObjectAtIndex:idx withObject:sleepSituation];
                *stop = YES;
            }
        }];
    }];
}


#pragma mark - settingAndGetting
- (UITableView*) tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        [self.view addSubview:_tableView];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.backgroundColor = [UIColor commonBackgroundColor];
        
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    
    return _tableView;
}

- (NSMutableArray<SleepSituation*>*) sleepSituations{
    if (!_sleepSituations) {
        _sleepSituations = [NSMutableArray<SleepSituation*> array];
        for (int idx = 0; idx < 2; ++idx) {
            SleepSituation* situation = [SleepSituation new];
            situation.code = idx;
            [_sleepSituations addObject:situation];
        }
    }
    return _sleepSituations;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sleepSituations.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    SleepSituationEditTableViewCell* cell = [[SleepSituationEditTableViewCell alloc] initWithSituation:self.sleepSituations[indexPath.row]];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.5;
}
@end
