//
//  RegisterAccountViewController.m
//  CherryGrow
//
//  Created by YinQ on 2018/12/26.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "RegisterAccountViewController.h"
#import "UserAccountModel.h"
#import "UserUtil.h"
#import "UserLoginViewControllerManager.h"

@interface RegisterAccountViewController ()

@property (nonatomic, strong) CommonInputTextView* accountInputTextView;
@property (nonatomic, strong) CommonInputTextView* passwordInputTextView;
@property (nonatomic, strong) CommonInputTextView* passwordConfirmInputTextView;

@end

@implementation RegisterAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"注册用户";
    [self layoutElements];
    
    UIBarButtonItem* nextBarButton = [[UIBarButtonItem alloc] initWithTitle:@"下一步" style:UIBarButtonItemStylePlain target:self action:@selector(nextBarButtonClicked:)];
    [self.navigationItem setRightBarButtonItem:nextBarButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) layoutElements{
    [self.accountInputTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(15);
        make.height.mas_equalTo(@47);
    }];
    
    [self.passwordInputTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.accountInputTextView.mas_bottom);
        make.height.mas_equalTo(@47);
    }];
    
    [self.passwordConfirmInputTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.passwordInputTextView.mas_bottom);
        make.height.mas_equalTo(@47);
    }];
}

#pragma mark - settingAndGetting
- (CommonInputTextView*) accountInputTextView{
    if (!_accountInputTextView) {
        _accountInputTextView = [[CommonInputTextView alloc] initWithName:@"登录名" placeHolder:@"6-15位登录名"];
        [_accountInputTextView setAutocapitalizationType:UITextAutocapitalizationTypeNone];
        [_accountInputTextView setAutocorrectionType:UITextAutocorrectionTypeNo];
        [self.view addSubview:_accountInputTextView];
        _accountInputTextView.mustFill = YES;
    }
    return _accountInputTextView;
}

- (CommonInputTextView*) passwordInputTextView{
    if (!_passwordInputTextView) {
        _passwordInputTextView = [[CommonInputTextView alloc] initWithName:@"登录密码" placeHolder:@"6-15位登录密码"];
        [self.view addSubview:_passwordInputTextView];
        _passwordInputTextView.secureTextEntry = YES;
        _passwordInputTextView.mustFill = YES;
    }
    return _passwordInputTextView;
}

- (CommonInputTextView*) passwordConfirmInputTextView{
    if (!_passwordConfirmInputTextView) {
        _passwordConfirmInputTextView = [[CommonInputTextView alloc] initWithName:@"确认密码" placeHolder:@"重复你的登录密码"];
        _passwordConfirmInputTextView.secureTextEntry = YES;
        [self.view addSubview:_passwordConfirmInputTextView];
        _passwordConfirmInputTextView.mustFill = YES;
    }
    return _passwordConfirmInputTextView;
}

#pragma mark - control event
- (void) nextBarButtonClicked:(id) sender{
    NSString* account = self.accountInputTextView.text;
    NSString* password = self.passwordInputTextView.text;
    NSString* passwordConfirm = self.passwordConfirmInputTextView.text;
    
    if (!account || account.length < 6 || account.length > 15) {
        [NSObject showAlert:@"请输入6-15位登录账号。"];
        return;
    }
    if (!password || password.length < 6 || password.length > 15) {
        [NSObject showAlert:@"请输入6-15位登录密码。"];
        return;
    }
    if (![passwordConfirm isEqualToString:password]) {
        [NSObject showAlert:@"请正确重复输入你的登录密码。"];
        return;
    }
    
    __block UserAccountModel* accountModel = [[UserAccountModel alloc] initWithAccount:account password:password];
    
    [SVProgressHUD showWithStatus:@"检查账号"];
    [UserUtil startValidLoginAccount:account success:^(id result) {
        [SVProgressHUD dismiss];
        //跳转用户信息录入界面
        [UserLoginViewControllerManager entryRegisterKidInfoPage:accountModel];
    } failed:^(NSInteger errCode, NSString *errMsg) {
        [SVProgressHUD dismiss];
    }];
}

@end
