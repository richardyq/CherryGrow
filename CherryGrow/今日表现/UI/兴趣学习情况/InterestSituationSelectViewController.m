//
//  InterestSituationSelectViewController.m
//  CherryGrow
//
//  Created by YinQ on 2018/11/26.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "InterestSituationSelectViewController.h"

@interface InterestSituationSelectViewController ()
<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, assign) NSInteger cateId;
@property (nonatomic, strong) UIView* selectView;
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) InterestStatusSelectHandler selectHandler;

@end

@implementation InterestSituationSelectViewController

+ (void) showWithCateId:(NSInteger) cateId handler:(InterestStatusSelectHandler) handler {
    InterestSituationSelectViewController* controller = (InterestSituationSelectViewController*)[self show];
    [controller setCateId:cateId];
    [controller setSelectHandler:handler];
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
    [self.selectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.equalTo(self.view).offset(-45);
    }];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.selectView).insets(UIEdgeInsetsMake(4, 7, 4, 7));
        make.height.mas_equalTo(@(3 * 47));
    }];
}

#pragma mark - settingAndGetting
- (UIView*) selectView{
    if (!_selectView) {
        _selectView = [[UIView alloc] init];
        [self.view addSubview:_selectView];
        _selectView.backgroundColor = [UIColor whiteColor];
        [_selectView setCornerRadius:4];
    }
    return _selectView;
}

- (UITableView*) tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        [self.selectView addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

#pragma mark - table view data source
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"InterestSituationSelectTableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"InterestSituationSelectTableViewCell"];
        
        [cell.textLabel setFont:[UIFont systemFontOfSize:17]];
        [cell.textLabel setTextColor:[UIColor commonTextColor]];
        
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    cell.textLabel.text = [self interestSituationName:indexPath.row];
    
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 47;
}

- (NSString*) interestSituationName:(NSInteger) situation{
    NSString* name = @"";
    switch (situation) {
        case 0:
            name = @"表现很差";
            break;
        case 1:
            name = @"表现一般";
            break;
        case 2:
            name = @"表现很好";
            break;
        default:
            break;
    }
    
    return name;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger status = indexPath.row;
    
    [self closeController];
    
    if (self.selectHandler) {
        self.selectHandler(self.cateId, status);
    }
}
@end
