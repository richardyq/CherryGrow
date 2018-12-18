//
//  StatisticsViewController.m
//  CherryGrow
//
//  Created by YinQ on 2018/12/18.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "StatisticsViewController.h"
#import "StatisticsModel.h"

@interface StatisticsHeaderView : UIView

@property (nonatomic, strong) UIView* countView;
@property (nonatomic, strong) UILabel* countTitleLabel;
@property (nonatomic, strong) UILabel* countLabel;

@property (nonatomic, strong) UIView* scoreView;
@property (nonatomic, strong) UILabel* scoreTitleLabel;
@property (nonatomic, strong) UILabel* scoreLabel;
@end

@implementation StatisticsHeaderView

- (id) initWithStatistics:(StatisticsModel*) statisticsModel{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self showBoarder:UIViewBorderLineTypeBottom];
        [self layotElements];
        
        self.countLabel.text = [NSString stringWithFormat:@"%ld", statisticsModel.count];
        self.scoreLabel.text = [NSString stringWithFormat:@"%.2f", statisticsModel.score];
    }
    return self;
}

- (void) layotElements{
    [self.countView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(self);
    }];
    
    [self.scoreView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.equalTo(self);
        make.width.equalTo(self.countView);
        make.left.equalTo(self.countView.mas_right);
    }];
    
    [self.countTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.countView);
        make.left.equalTo(self.countView).offset(15);
    }];
    
    [self.countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.countView);
        make.left.equalTo(self.countTitleLabel.mas_right).offset(10);
    }];
    
    [self.scoreTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.scoreView);
        make.left.equalTo(self.scoreView);
    }];
    
    [self.scoreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.scoreView);
        make.left.equalTo(self.scoreTitleLabel.mas_right).offset(10);
    }];
}

#pragma mark - settingAndGetting
- (UIView*) countView{
    if (!_countView) {
        _countView = [[UIView alloc] init];
        [self addSubview:_countView];
    }
    return _countView;
}

- (UILabel*) countTitleLabel{
    if (!_countTitleLabel) {
        _countTitleLabel = [self.countView addLabel];
        _countTitleLabel.textColor = [UIColor commonTextColor];
        _countTitleLabel.font = [UIFont systemFontOfSize:14];
        _countTitleLabel.text = @"记录次数:";
    }
    return _countTitleLabel;
}

- (UILabel*) countLabel{
    if (!_countLabel) {
        _countLabel = [self.countView addLabel];
        _countLabel.textColor = [UIColor commonTextColor];
        _countLabel.font = [UIFont systemFontOfSize:14];
        _countLabel.text = @"0";
    }
    return _countLabel;
}

- (UIView*) scoreView{
    if (!_scoreView) {
        _scoreView = [[UIView alloc] init];
        [self addSubview:_scoreView];
    }
    return _scoreView;
}

- (UILabel*) scoreTitleLabel{
    if (!_scoreTitleLabel) {
        _scoreTitleLabel = [self.scoreView addLabel];
        _scoreTitleLabel.textColor = [UIColor commonTextColor];
        _scoreTitleLabel.font = [UIFont systemFontOfSize:14];
        _scoreTitleLabel.text = @"平均分:";
    }
    return _scoreTitleLabel;
}

- (UILabel*) scoreLabel{
    if (!_scoreLabel) {
        _scoreLabel = [self.scoreView addLabel];
        _scoreLabel.textColor = [UIColor commonTextColor];
        _scoreLabel.font = [UIFont systemFontOfSize:14];
        _scoreLabel.text = @"0";
    }
    return _scoreLabel;
}
@end

@interface StatisticsViewController ()
@property (nonatomic, readonly) StatisticsModel* statisticsModel;
@property (nonatomic, strong) StatisticsHeaderView* headerView;

@property (nonatomic, strong) UITableViewController* tableViewController;

@end

@implementation StatisticsViewController
@synthesize paramDictionary = _paramDictionary;

- (id) initWithStatistics:(StatisticsModel*) statisticsModel{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _statisticsModel = statisticsModel;
        _paramDictionary = [statisticsModel mj_keyValues];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self layoutElements];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) layoutElements{
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.height.mas_equalTo(@47);
    }];
    
    [self.tableViewController.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.headerView.mas_bottom);
    }];
}

#pragma mark - settingAndGetting
- (StatisticsHeaderView*) headerView{
    if (!_headerView) {
        _headerView = [[StatisticsHeaderView alloc] initWithStatistics:self.statisticsModel];
        [self.view addSubview:_headerView];
    }
    return _headerView;
}

- (UITableViewController*) tableViewController{
    if (!_tableViewController) {
        Class tableController = [self tableControllerClass];
        
        _tableViewController = [[tableController alloc] initWithStyle:UITableViewStylePlain];
        [self addChildViewController:_tableViewController];
        [self.view addSubview: _tableViewController.tableView ];
    }
    return _tableViewController;
}

- (Class) tableControllerClass{
    Class tableControllerClass = [UITableViewController class];
    return tableControllerClass;
}

@end
