//
//  UserLoginViewController.m
//  CherryGrow
//
//  Created by YinQ on 2018/10/24.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "UserLoginViewController.h"
#import "UserUtil.h"

#import "UserAccountModel.h"
#import "UserModel.h"

#import "InitializationUtil.h"
#import "UserUtil.h"

@interface UserLoginViewController ()

@property (nonatomic, strong) UIImageView* logoImageView;

@property (nonatomic, strong) UITextField* accountTextField;
@property (nonatomic, strong) UITextField* passwordTextField;
@property (nonatomic, strong) UIButton* loginButton;

@property (nonatomic, readonly) NSString* accountString;
@property (nonatomic, readonly) NSString* passwordString;

@end

@implementation UserLoginViewController

@synthesize accountString = _accountString;
@synthesize passwordString = _passwordString;

- (void) loadView{
    UIControl* closeControl = [UIControl new];
    [self setView:closeControl];
    [closeControl addTarget:self action:@selector(closeControlClicked:) forControlEvents:UIControlEventAllTouchEvents];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor commonBackgroundColor]];
    UserAccountModel* account = [[UserDefaults shareInstance] loginedUserAccount];
    if (account) {
        self.accountTextField.text = account.account;
        self.passwordTextField.text = account.password;
    }
    
    [self layoutElements];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) layoutElements{
    [self.logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(44, 44));
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).offset(65);
    }];
    
    [self.accountTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(@220);
        make.height.mas_equalTo(@42);
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.logoImageView.mas_bottom).offset(33);
    }];
    
    [self.passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(@220);
        make.height.mas_equalTo(@42);
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.accountTextField.mas_bottom).offset(10);
    }];
    
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(200, 45));
        make.top.equalTo(self.passwordTextField.mas_bottom).offset(22);
    }];
}

#pragma mark - settingAndGetting
- (UIImageView*) logoImageView{
    if (!_logoImageView) {
        _logoImageView = [self addImageView:@"cherry_logo"];
        [_logoImageView setCornerRadius:22 color:[UIColor commonControlBorderColor] boarderwidth:1];
    }
    return _logoImageView;
}

- (UITextField*) accountTextField{
    if (!_accountTextField) {
        _accountTextField = [self addTextField:@"请输入6-18位登录账号"];
        _accountTextField.font = [UIFont systemFontOfSize:16];
        _accountTextField.textColor = [UIColor commonTextColor];
        
        _accountTextField.autocorrectionType = UITextAutocorrectionTypeNo;
        _accountTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        _accountTextField.keyboardType = UIKeyboardTypeASCIICapable;
        _accountTextField.returnKeyType = UIReturnKeyDone;
        [_accountTextField showBoarder:UIViewBorderLineTypeBottom];
        _accountTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return _accountTextField;
}

- (UITextField*) passwordTextField{
    if (!_passwordTextField) {
        _passwordTextField = [self addTextField:@"请输入6-18位登录密码"];
        _passwordTextField.font = [UIFont systemFontOfSize:16];
        _passwordTextField.textColor = [UIColor commonTextColor];
        
        _passwordTextField.returnKeyType = UIReturnKeyJoin;
        [_passwordTextField showBoarder:UIViewBorderLineTypeBottom];
        _passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _passwordTextField.secureTextEntry = YES;
    }
    
    return _passwordTextField;
}

- (UIButton*) loginButton{
    if (!_loginButton) {
        _loginButton = [self addButton:UIButtonTypeCustom];
        UIImage* bgImage = [UIImage rectImage:[UIColor mainThemeColor] size:CGSizeMake(200, 45)];
        [_loginButton setBackgroundImage:bgImage forState:UIControlStateNormal];
        
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [_loginButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
        [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_loginButton setCornerRadius:4.5];
        
        [_loginButton addTarget:self action:@selector(loginButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginButton;
}

- (NSString*) accountString{
    return self.accountTextField.text;
}

- (NSString*) passwordString{
    return self.passwordTextField.text;
}

#pragma mark - control events

- (void) closeControlClicked:(id) sender{
    [self.view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull subview, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([subview isKindOfClass:[UITextField class]]) {
            UITextField* textfield = (UITextField*) subview;
            [textfield resignFirstResponder];
        }
    }];
}

- (void) loginButtonClicked:(id) sender{
    if (!self.accountString || self.accountString.length < 6 || self.accountString.length > 18) {
        [NSObject showAlert:@"输入账号不正确，请输入您的6-18位登录账号。"];
        return;
    }
    
    if (!self.passwordString || self.passwordString.length < 6 || self.passwordString.length > 18) {
        [NSObject showAlert:@"输入密码不正确，请输入您的6-18位登录密码。"];
        return;
    }
    
    [UserUtil startLogin:self.accountString password:self.passwordString success:^(id result) {
        UserAccountModel* accountModel = (UserAccountModel*) result;
        
    } failed:^(NSInteger errCode, NSString *errMsg) {
        
    }];
    return;
    /*
    UserModel* user = [UserUtil getUserModelWithAccount:self.accountString];
    if (!user) {
        [NSObject showAlert:@"用户不存在。"];
        return;
    }
    [self saveLoginedUserAccount];
    [[InitializationUtil new] startInitialize];
    */
}

- (void) saveLoginedUserAccount{
    UserAccountModel* account = [[UserAccountModel alloc] initWithAccount:self.accountString password:self.passwordString];
    [[UserDefaults shareInstance] setLoginedUserAccount:account];
}
@end
