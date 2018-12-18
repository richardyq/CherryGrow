//
//  StatisticStartViewController.m
//  CherryGrow
//
//  Created by YinQ on 2018/12/17.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "StatisticStartViewController.h"
#import "StatisticsStartTableViewController.h"

@interface StatisticStartViewController ()

@property (nonatomic, strong) StatisticsStartTableViewController* tableViewController;
@end

@implementation StatisticStartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"统计";
    [self layoutElements];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) layoutElements{
    [self.tableViewController.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - settingAndGetting
- (StatisticsStartTableViewController*) tableViewController{
    if (!_tableViewController) {
        _tableViewController = [[StatisticsStartTableViewController alloc] init];
        [self addChildViewController:_tableViewController];
        [self.view addSubview:_tableViewController.tableView];
    }
    return _tableViewController;
}

@end
