//
//  RegisterKidInfoViewController.m
//  CherryGrow
//
//  Created by YinQ on 2018/12/26.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "RegisterKidInfoViewController.h"
#import "UserAccountModel.h"
#import "UserLoginViewControllerManager.h"
#import "KidInfoModel.h"

@interface RegisterKidInfoViewController ()
@property (nonatomic, readonly) UserAccountModel* accountModel;

@property (nonatomic, strong) CommonInputTextView* kidNameInputTextView;
@property (nonatomic, strong) CommonInputTextView* nickNameInputTextView;
@end

@implementation RegisterKidInfoViewController

@synthesize paramDictionary = _paramDictionary;
- (id) initWithAccountModel:(UserAccountModel*) accountModel{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _accountModel = accountModel;
        if (accountModel) {
            _paramDictionary = [accountModel mj_keyValues];
        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"孩子信息";
    [self layoutElements];
    
    UIBarButtonItem* nextBarButton = [[UIBarButtonItem alloc] initWithTitle:@"下一步" style:UIBarButtonItemStylePlain target:self action:@selector(nextBarButtonClicked:)];
    self.navigationItem.rightBarButtonItem = nextBarButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) layoutElements{
    [self.kidNameInputTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(@47);
        make.top.equalTo(self.view).offset(14);
    }];
    
    [self.nickNameInputTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(@47);
        make.top.equalTo(self.kidNameInputTextView.mas_bottom);
    }];
}

#pragma mark - settingAndGetting
- (CommonInputTextView*) kidNameInputTextView{
    if (!_kidNameInputTextView) {
        _kidNameInputTextView = [[CommonInputTextView alloc] initWithName:@"孩子姓名" placeHolder:@"请输入孩子姓名"];
        [self.view addSubview:_kidNameInputTextView];
        _kidNameInputTextView.mustFill = YES;
    }
    return _kidNameInputTextView;
}

- (CommonInputTextView*) nickNameInputTextView{
    if (!_nickNameInputTextView) {
        _nickNameInputTextView = [[CommonInputTextView alloc] initWithName:@"孩子昵称" placeHolder:@"请输入孩子昵称"];
        [self.view addSubview:_nickNameInputTextView];
        _nickNameInputTextView.mustFill = YES;
    }
    return _nickNameInputTextView;
}
                                      
#pragma mark - settingAndGetting
- (void) nextBarButtonClicked:(id) sender{
    NSString* kidName = self.kidNameInputTextView.text;
    NSString* nickName = self.nickNameInputTextView.text;
    
    if (!kidName || ![kidName isNotBlank]) {
        [NSObject showAlert:@"请输入孩子的姓名。"];
        return;
    }
    
    if (!nickName || ![nickName isNotBlank]) {
        [NSObject showAlert:@"请输入孩子的昵称。"];
        return;
    }
    KidInfoModel* kidInfoModel = [[KidInfoModel alloc] init];
    kidInfoModel.name = kidName;
    kidInfoModel.nickname = nickName;
    
    [UserLoginViewControllerManager entryRegisterUserInfoPage:self.accountModel kidInfo:kidInfoModel];
}
                                
@end
