//
//  MainStartViewController.m
//  CherryGrow
//
//  Created by YinQ on 2018/10/25.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "MainStartViewController.h"
#import "TodayStartViewController.h"
#import "HistoryStartViewController.h"
#import "PersonStartViewController.h"

@interface MainStartViewController ()

@end

@implementation MainStartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tabBar.barTintColor = [UIColor mainThemeColor];
    self.tabBar.tintColor = [UIColor whiteColor];
    [self initContorllers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) initContorllers{
    //今天
    UIViewController* todayController = [[TodayStartViewController alloc] init];
    UINavigationController* todayNaviController = [[BaseNavigationController alloc] initWithRootViewController:todayController];
    todayController.navigationItem.title = @"今天";
    todayNaviController.tabBarItem.title = @"今天";
    todayNaviController.navigationBar.translucent = NO;
    //历史
    UIViewController* historyController = [[HistoryStartViewController alloc] init];
    UINavigationController* historyNaviController = [[BaseNavigationController alloc] initWithRootViewController:historyController];
    historyController.navigationItem.title = @"历史";
    historyNaviController.tabBarItem.title = @"历史";
    historyNaviController.navigationBar.translucent = NO;
    //我的
    UIViewController* personController = [[PersonStartViewController alloc] init];
    UINavigationController* personNaviController = [[BaseNavigationController alloc] initWithRootViewController:personController];
    personController.navigationItem.title = @"我的";
    personNaviController.tabBarItem.title = @"我";
    personNaviController.navigationBar.translucent = NO;
    
    [self setViewControllers:@[todayNaviController, historyNaviController, personNaviController]];
}

@end
