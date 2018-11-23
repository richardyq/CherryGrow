//
//  InterestSituationStartViewController.m
//  CherryGrow
//
//  Created by YinQ on 2018/10/25.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "InterestSituationStartViewController.h"
#import "InterestCateSelectViewController.h"

@interface InterestSituationStartViewController ()

@property (nonatomic, strong) UIView* bottomView;
@property (nonatomic, strong) UIButton* appendButton;

@end

@implementation InterestSituationStartViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"兴趣学习情况";
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
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.height.mas_equalTo(@64);
    }];
    
    [self.appendButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.bottomView).offset(-50);
        make.height.mas_equalTo(@41);
        make.center.equalTo(self.bottomView);
    }];
}

#pragma mark - setingAndGetting
- (UIView*) bottomView{
    if (!_bottomView) {
        _bottomView = [[UIView alloc] init];
        [self.view addSubview:_bottomView];
        _bottomView.backgroundColor = [UIColor whiteColor];
    }
    return _bottomView;
}

- (UIButton*) appendButton{
    if (!_appendButton) {
        _appendButton = [self.bottomView addButton:UIButtonTypeCustom];
        [_appendButton setBackgroundImage:[UIImage rectImage:[UIColor mainThemeColor] size:CGSizeMake(300, 35)] forState:UIControlStateNormal];
        [_appendButton setTitle:@"添加" forState:UIControlStateNormal];
        [_appendButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _appendButton.titleLabel.font = [UIFont systemFontOfSize:18];
        [_appendButton addTarget:self action:@selector(appendButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [_appendButton setCornerRadius:4];
    }
    return _appendButton;
}

#pragma mark - button events
- (void) appendButtonClicked:(id) sender
{
    [InterestCateSelectViewController show];
}
@end
