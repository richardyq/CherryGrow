//
//  InterestSituationStartViewController.m
//  CherryGrow
//
//  Created by YinQ on 2018/10/25.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "InterestSituationStartViewController.h"
#import "InterestCateSelectViewController.h"
#import "InterestSituationSelectViewController.h"
#import "SituationRequestManager.h"
#import "InterestSituation.h"
#import "TodayInterestSituationTableViewCell.h"

@interface InterestSituationStartViewController ()
<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UIView* bottomView;
@property (nonatomic, strong) UIButton* appendButton;
@property (nonatomic, strong) UITableView* tableView;

@property (nonatomic, strong) NSMutableArray<InterestSituation*>* situations;

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
    
    [self startLoadTodayStatus];
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
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.bottomView.mas_bottom);
    }];
}

- (void) startLoadTodayStatus{
    __weak typeof(self) weakSelf = self;
    [SituationRequestManager creatTodayInterestSituationRequest:^(id result) {
        if (!weakSelf) {
            return ;
        }
        __strong typeof(self) strongSelf = weakSelf;
        NSArray<InterestSituation*>* situations = ( NSArray<InterestSituation*>*) result;
        [strongSelf interestSituationLoaded:situations];
    } failed:^(NSInteger errorCode, NSString *message) {
        [NSObject showAlert:message];
    } complete:^(NSInteger errorCode) {
        if (!weakSelf) {
            return ;
        }
        __strong typeof(self) strongSelf = weakSelf;
        if (errorCode == 0) {
            [strongSelf refreshSituationList];
        }
        
    }];
}

- (void) showSituationSelectController:(NSInteger) cateId{
    __weak typeof(self) weakSelf = self;
    [InterestSituationSelectViewController showWithCateId:cateId handler:^(NSInteger cid, NSInteger status) {
        if (!weakSelf) {
            return ;
        }
        __strong typeof(self) strongSelf = weakSelf;
        [strongSelf postInterestSituation:cid status:status];
        
    }];
}

- (void) postInterestSituation:(int) cateId status:(NSInteger) status{
    __weak typeof(self) weakSelf = self;
    [SituationRequestManager createAddInterestSituationRequest:cateId status:status success:^(id result) {
        if (!weakSelf || ![result isKindOfClass:[InterestSituation class]]) {
            return ;
        }
        __strong typeof(self) strongSelf = weakSelf;
        InterestSituation* situation = (InterestSituation*) result;
        [strongSelf interestSituationAppended:situation];
    } failed:^(NSInteger errorCode, NSString *message) {
        [NSObject showAlert:message];
    } complete:^(NSInteger errorCode) {
        if (!weakSelf || errorCode != 0) {
            return ;
        }
        __strong typeof(self) strongSelf = weakSelf;
        [strongSelf refreshSituationList];
    }];
}

- (void) interestSituationAppended:(InterestSituation*) situation{
    [self.situations addObject:situation];
}

- (void) refreshSituationList{
    [self.tableView reloadData];
}

- (void) interestSituationLoaded:(NSArray<InterestSituation*>*) situations{
    _situations = [NSMutableArray<InterestSituation*> arrayWithArray:situations];
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

- (UITableView*) tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        [self.view addSubview:_tableView];
        [_tableView setDelegate:self];
        [_tableView setDataSource:self];
        _tableView.backgroundColor = [UIColor commonBackgroundColor];
        [_tableView registerClass:[TodayInterestSituationTableViewCell class] forCellReuseIdentifier:@"TodayInterestSituationTableViewCell"];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.estimatedSectionFooterHeight = 0;
        
    }
    return _tableView;
}

- (NSMutableArray<InterestSituation*>*) situations{
    if (!_situations) {
        _situations = [NSMutableArray<InterestSituation*> array];
    }
    return _situations;
}

#pragma mark - button events
- (void) appendButtonClicked:(id) sender
{
    __weak typeof(self) weakSelf = self;
    [InterestCateSelectViewController showWithHandler:^(InterestCateModel *model) {
        if (!weakSelf) {
            return ;
        }
        __strong typeof(self) strongSelf = weakSelf;
        [strongSelf showSituationSelectController:model.cateId];
    }];
}

#pragma mark - table view delegate
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.situations) {
        return self.situations.count;
    }
    return 0;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TodayInterestSituationTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"TodayInterestSituationTableViewCell"];
    [cell setSituation:self.situations[indexPath.row]];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.5;
}
@end
