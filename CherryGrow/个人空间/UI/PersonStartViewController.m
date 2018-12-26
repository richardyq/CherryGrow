//
//  PersonStartViewController.m
//  CherryGrow
//
//  Created by YinQ on 2018/12/19.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "PersonStartViewController.h"
#import "PersonHeaderView.h"
#import "PersonKidInfoView.h"

@interface PersonStartViewController ()

@property (nonatomic, strong) PersonHeaderView* personHeaderView;
@property (nonatomic, strong) PersonKidInfoView* kidInfoView;

@end

@implementation PersonStartViewController

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
    [self.personHeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.height.mas_equalTo(@88);
    }];
    
    [self.kidInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.width.equalTo(self.view).offset(-35);
        make.height.mas_equalTo(@54);
        make.top.equalTo(self.personHeaderView.mas_bottom).offset(-17.5);
    }];
}

#pragma mark - settingAndGetting
- (PersonHeaderView*) personHeaderView{
    if (!_personHeaderView) {
        _personHeaderView = [PersonHeaderView new];
        [self.view addSubview:_personHeaderView];
    }
    return _personHeaderView;
}

- (PersonKidInfoView*) kidInfoView{
    if (!_kidInfoView) {
        _kidInfoView = [[PersonKidInfoView alloc] init];
        [self.view addSubview:_kidInfoView];
    }
    return _kidInfoView;
}

@end
