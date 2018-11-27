//
//  HistoryStartViewController.m
//  CherryGrow
//
//  Created by YinQ on 2018/11/26.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "HistoryStartViewController.h"

@interface HistoryStartViewController ()

@property (nonatomic, strong) HistoryTableViewController* tableViewController;
@end

@implementation HistoryStartViewController

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
    [self.tableViewController.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - settingAndGetting
- (HistoryTableViewController*) tableViewController{
    if (!_tableViewController) {
        _tableViewController = [[HistoryTableViewController alloc] init];
        [self addChildViewController:_tableViewController];
        [self.view addSubview:_tableViewController.tableView];
    }
    return _tableViewController;
}

@end
