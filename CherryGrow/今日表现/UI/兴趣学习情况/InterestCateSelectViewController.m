//
//  InterestCateSelectViewController.m
//  CherryGrow
//
//  Created by YinQ on 2018/11/21.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "InterestCateSelectViewController.h"
#import "SituationRequestManager.h"

//#import "YYKit.h"

@interface InterestCateSelectViewController ()
<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIView* selectView;
@property (nonatomic, strong) UITableView* tableView;

@property (nonatomic, readonly) NSArray<InterestCateModel*>* cateModels;

@property (nonatomic, strong) InterestCateSelectHandler selectHandler;
@end

@implementation InterestCateSelectViewController

+ (void) showWithHandler:(InterestCateSelectHandler) handler{
    InterestCateSelectViewController* controller = (InterestCateSelectViewController*)[self show];
    [controller setSelectHandler:handler];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadInterestCates];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) loadInterestCates{
    __weak typeof(self) weakSelf = self;
    [SituationRequestManager createInterestCatesRequest:^(id result) {
        if (!result || ![result isKindOfClass:[NSArray<InterestCateModel*> class]]) {
            return ;
        }
        if (!weakSelf) {
            return ;
        }
        __strong typeof(self) strongSelf = weakSelf;
        [strongSelf interestCatesLoaded:result];
    } failed:^(NSInteger errorCode, NSString *message) {
        
    } complete:^(NSInteger errorCode) {
        if (!weakSelf) {
            return ;
        }
        __strong typeof(self) strongSelf = weakSelf;
        if (errorCode == 0) {
            [strongSelf createCatePicker];
        }
    }];
}

- (void) interestCatesLoaded:(NSArray<InterestCateModel*>*) models{
    _cateModels = models;
}

- (void) createCatePicker{
    
    if (_tableView) {
        [_tableView removeFromSuperview];
        _tableView = nil;
    }
    
    if (_selectView) {
        [_selectView removeFromSuperview];
        _selectView = nil;
    }
    
    _selectView = [[UIView alloc] init];
    [self.view addSubview:_selectView];
    [_selectView setCornerRadius:4];
    [_selectView setBackgroundColor:[UIColor whiteColor]];
    
    _tableView = [[UITableView alloc] init];
    [self.selectView addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    CGFloat tableHeight = self.cateModels.count * 47;
    if (tableHeight > (kScreenHeight * 0.6)) {
        tableHeight = (kScreenHeight * 0.6);
    }
    
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"InterestCateSelectTableCell"];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.selectView).insets(UIEdgeInsetsMake(6, 12, 6, 12));
        make.height.mas_equalTo(@(tableHeight));
    }];
    
    [_selectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.equalTo(self.view).offset(-35);
    }];
}

#pragma mark - table view datesource
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.cateModels) {
        return self.cateModels.count;
    }
    return 0;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"InterestCateSelectTableCell"];
    [cell.textLabel setFont:[UIFont systemFontOfSize:16]];
    cell.textLabel.textColor = [UIColor commonTextColor];
    cell.textLabel.text = self.cateModels[indexPath.row].name;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark - table view delegate
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    InterestCateModel* cate = self.cateModels[indexPath.row];
    
    [self closeController];
    
    if (self.selectHandler) {
        self.selectHandler(cate);
    }
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 47;
}

@end
