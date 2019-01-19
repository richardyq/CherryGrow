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
#import "UserUtil.h"

@interface PersonStartViewController ()
{
    BOOL hasBeenLayout;
}
@property (nonatomic, strong) PersonHeaderView* personHeaderView;
@property (nonatomic, strong) PersonKidInfoView* kidInfoView;
@property (nonatomic, strong) UIButton* logoutButton;

@end

@implementation PersonStartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self layoutElements];
}

- (void) layoutElements{
    if (hasBeenLayout) {
        return;
    }
    hasBeenLayout = YES;
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
    
    [self.logoutButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(300, 45));
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-54);
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

- (UIButton*) logoutButton{
    if (!_logoutButton) {
        _logoutButton = [self addButton:UIButtonTypeCustom];
        UIImage* btnBackgroundImageView = [UIImage rectImage:[UIColor mainThemeColor] size:CGSizeMake(300, 54)];
        [_logoutButton setBackgroundImage:btnBackgroundImageView forState:UIControlStateNormal];
        [_logoutButton setTitle:@"退出登录" forState:UIControlStateNormal];
        [_logoutButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _logoutButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [_logoutButton setCornerRadius:4];
        
        [_logoutButton addTarget:self action:@selector(logoutButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _logoutButton;
}

#pragma mark - button click event
- (void) logoutButtonClicked:(id) sender{
    [UserUtil userLogout];
    
    [[PageViewControllerManager defaultManager] entryUserLoginPage];
}

@end
