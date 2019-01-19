//
//  RegisterUserInfoViewController.m
//  CherryGrow
//
//  Created by YinQ on 2018/12/26.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "RegisterUserInfoViewController.h"
#import "UserAccountModel.h"
#import "KidInfoModel.h"
#import "RadioGroup.h"
#import "UserModel.h"

@interface UserInfoGenderView : UIView

@property (nonatomic, strong) UILabel* nameLabel;
@property (nonatomic, strong) RadioGroup* radioGroup;
@property (nonatomic, readonly) NSInteger gender;

@end

@implementation UserInfoGenderView

- (id) init{
    self = [super init];
    if (self) {
        [self layoutElements];
        self.nameLabel.text = @"性别";
        
        self.backgroundColor = [UIColor whiteColor];
        [self showBoarder:UIViewBorderLineTypeBottom];
    }
    return self;
}

- (void) layoutElements{
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self).offset(12.5);
    }];
    
    [self.radioGroup mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.height.equalTo(self);
        make.right.equalTo(self).offset(-12.5);
        make.left.equalTo(self.nameLabel.mas_right);
        make.width.equalTo(self.nameLabel).multipliedBy(2);
    }];
}

#pragma mark - settingAndGetitng
- (UILabel*) nameLabel{
    if (!_nameLabel) {
        _nameLabel = [self addLabel];
        _nameLabel.font = [UIFont systemFontOfSize:14];
        _nameLabel.textColor = [UIColor commonTextColor];
    }
    return _nameLabel;
}

- (RadioGroup*) radioGroup{
    if (!_radioGroup) {
        _radioGroup = [[RadioGroup alloc] initWithTitles:@[@"男", @"女"] orientation:Radio_Horizontal];
        [self addSubview:_radioGroup];
    }
    return _radioGroup;
}

- (NSInteger) gender{
    return self.radioGroup.selectedIndex + 1;
}

@end

@interface RegisterUserInfoViewController ()

@property (nonatomic, readonly) UserAccountModel* accountModel;
@property (nonatomic, readonly) KidInfoModel* kidInfo;
@property (nonatomic, strong) CommonInputTextView* userNameInputTextView;
@property (nonatomic, strong) CommonInputTextView* relationInputTextView;
@property (nonatomic, strong) CommonInputTextView* mobileInputTextView;

@property (nonatomic, strong) UserInfoGenderView* genderView;

@property (nonatomic, strong) UIButton* registerButton;

@end

@implementation RegisterUserInfoViewController
@synthesize paramDictionary = _paramDictionary;
- (id) initWithAccountModel:(UserAccountModel*) accountModel
                    kidInfo:(KidInfoModel*) kidInfo{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _accountModel = accountModel;
        _kidInfo = kidInfo;
        if (accountModel) {
            _paramDictionary = [accountModel mj_keyValues];
            
        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"你的信息";
    
    [self layoutElements];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) layoutElements{
    [self.userNameInputTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(14);
        make.height.equalTo(@47);
    }];
    
    [self.relationInputTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.userNameInputTextView.mas_bottom);
        make.height.equalTo(@47);
    }];
    
    [self.mobileInputTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.relationInputTextView.mas_bottom);
        make.height.equalTo(@47);
    }];
    
    [self.genderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.mobileInputTextView.mas_bottom);
        make.height.equalTo(@47);
    }];
    
    [self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(200, 45));
        make.top.equalTo(self.genderView.mas_bottom).offset(22);
    }];
}

#pragma mark - settingAndGetting
- (CommonInputTextView*) userNameInputTextView{
    if (!_userNameInputTextView) {
        _userNameInputTextView = [[CommonInputTextView alloc] initWithName:@"姓名" placeHolder:@"请输入您的姓名"];
        _userNameInputTextView.mustFill = YES;
        [self.view addSubview:_userNameInputTextView];
    }
    return _userNameInputTextView;
}

- (CommonInputTextView*) relationInputTextView{
    if (!_relationInputTextView) {
        _relationInputTextView = [[CommonInputTextView alloc] initWithName:@"关系" placeHolder:@"请输入关系"];
        _relationInputTextView.mustFill = YES;
        [self.view addSubview:_relationInputTextView];
    }
    return _relationInputTextView;
}

- (CommonInputTextView*) mobileInputTextView{
    if (!_mobileInputTextView) {
        _mobileInputTextView = [[CommonInputTextView alloc] initWithName:@"手机号" placeHolder:@"请输入手机号"];
        _mobileInputTextView.keyboardType = UIKeyboardTypeNumberPad;
        [self.view addSubview:_mobileInputTextView];
    }
    return _mobileInputTextView;
}



- (UserInfoGenderView*) genderView{
    if (!_genderView) {
        _genderView = [[UserInfoGenderView alloc] init];
        [self.view addSubview:_genderView];
    }
    return _genderView;
}

- (UIButton*) registerButton{
    if (!_registerButton) {
        _registerButton = [self addButton:UIButtonTypeCustom];
        UIImage* bgImage = [UIImage rectImage:[UIColor mainThemeColor] size:CGSizeMake(200, 45)];
        [_registerButton setBackgroundImage:bgImage forState:UIControlStateNormal];
        
        [_registerButton setTitle:@"注册" forState:UIControlStateNormal];
        [_registerButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
        [_registerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_registerButton setCornerRadius:4.5];
        
        [_registerButton addTarget:self action:@selector(registerButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _registerButton;
}

#pragma mark - control events

- (void) birthdayPickControlClicked:(id) sender{
    __weak typeof(self) weakSelf = self;
    [DatePickerViewController showWithDate:nil handler:^(NSString *dateString) {
        if (!weakSelf) {
            return ;
        }
        __strong typeof(self) strongSelf = weakSelf;
        //strongSelf.birthInputTextView.textField.text = dateString;
    }];
}

- (void) registerButtonClicked:(id) sender{
    NSString* userName = self.userNameInputTextView.text;
    NSString* relation = self.relationInputTextView.text;
    NSString* mobile = self.mobileInputTextView.text;
    
    if (!userName || ![userName isNotBlank]) {
        [NSObject showAlert:@"请输入你的姓名。"];
        return;
    }
    
    if (!relation || ![relation isNotBlank]) {
        [NSObject showAlert:@"请输入你和小孩的关系。"];
        return;
    }
    
    UserModel* user = [UserModel new];
    user.userName = userName;
    user.relation = relation;
    if (mobile && [mobile isNotBlank]) {
        user.mobile = mobile;
    }
    user.gender = self.genderView.gender;
}
@end
