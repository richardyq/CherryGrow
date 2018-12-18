//
//  HistoryStartViewController.m
//  CherryGrow
//
//  Created by YinQ on 2018/11/26.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "HistoryStartViewController.h"
#import "HistoryTypeSelectViewController.h"
#import "StatisticsPageManager.h"

@interface HistoryStartViewController ()
<UITextFieldDelegate>
@property (nonatomic, strong) UIView* topView;
@property (nonatomic, strong) UIView* dateSelectView;
@property (nonatomic, strong) UITextField* startDateTextField;
@property (nonatomic, strong) UIControl* startDateControl;
@property (nonatomic, strong) UILabel* midLabel;
@property (nonatomic, strong) UITextField* endDateTextField;
@property (nonatomic, strong) UIControl* endDateControl;

@property (nonatomic, strong) UIView* typeView;
@property (nonatomic, strong) UILabel* typeLabel;
@property (nonatomic, strong) UIControl* typeControl;
@property (nonatomic, readonly) HistoryTypeModel* typeModel;
@property (nonatomic, strong) UIButton* queryButton;
@property (nonatomic, strong) UIButton* clearButton;

@property (nonatomic, strong) UIView* statisticView;
@property (nonatomic, strong) UIButton* statisticButton;

@property (nonatomic, strong) HistoryTableViewController* tableViewController;

@property (nonatomic, readonly) NSDate* startDate;
@property (nonatomic, readonly) NSDate* endDate;

@end

@implementation HistoryStartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _typeModel = [HistoryTypeModel typeModel:HistoryType_All];
    [self layoutElements];
    
//    [self.dateSelectView bringSubviewToFront:self.startDateControl];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

- (void) layoutElements{
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.height.mas_equalTo(@47);
    }];
    
    [self.dateSelectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.top.equalTo(self.topView);
        
    }];
    
    [self.midLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.dateSelectView);
    }];
    
    [self.startDateTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.dateSelectView).offset(10);
        make.height.equalTo(self.dateSelectView).offset(-12);
        make.right.equalTo(self.midLabel.mas_right).offset(-5);
        make.centerY.equalTo(self.dateSelectView);
    }];
    
    [self.startDateControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.startDateTextField);
    }];
    
    [self.endDateTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.dateSelectView).offset(-10);
        make.height.equalTo(self.dateSelectView).offset(-12);
        make.left.equalTo(self.midLabel.mas_right).offset(5);
        make.centerY.equalTo(self.dateSelectView);
    }];
    
    [self.endDateControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.endDateTextField);
    }];
    
    [self.typeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.top.equalTo(self.topView);
        make.width.equalTo(self.dateSelectView);
        make.left.equalTo(self.dateSelectView.mas_right);
    }];
    
    [self.statisticView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.topView.mas_bottom);
        make.height.mas_equalTo(@47);
    }];
    
    [self.statisticButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(56, 31));
        make.centerY.equalTo(self.statisticView);
        make.right.equalTo(self.statisticView).offset(-12.5);
    }];
    
    [self.tableViewController.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.statisticView.mas_bottom);
    }];
    
    [self.typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.typeView);
        make.left.equalTo(self.typeView).offset(7);
    }];
    
    [self.typeControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.typeView);
        make.left.equalTo(self.typeView).offset(7);
        make.size.mas_equalTo(CGSizeMake(68, 40));
    }];
    
    [self.clearButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.typeControl.mas_right).offset(5);
        make.width.mas_equalTo(@50);
        make.centerY.equalTo(self.typeView);
        make.height.equalTo(self.typeView).offset(-20);
    }];
    
    [self.queryButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.clearButton.mas_right).offset(4);
        //make.right.equalTo(self.typeView).offset(-4);
        make.centerY.equalTo(self.typeView);
        make.size.equalTo(self.clearButton);
    }];
    
    
    
}

#pragma mark - settingAndGetting
- (UIView*) topView{
    if (!_topView) {
        _topView = [[UIView alloc] init];
        [self.view addSubview:_topView];
        [_topView setBackgroundColor:[UIColor whiteColor]];
    }
    return _topView;
}

- (HistoryTableViewController*) tableViewController{
    if (!_tableViewController) {
        _tableViewController = [[HistoryTableViewController alloc] init];
        [self addChildViewController:_tableViewController];
        [self.view addSubview:_tableViewController.tableView];
    }
    return _tableViewController;
}

- (UIView*) dateSelectView{
    if (!_dateSelectView) {
        _dateSelectView = [[UIView alloc] init];
        [self.topView addSubview:_dateSelectView];
        [_dateSelectView setBackgroundColor:[UIColor whiteColor]];
        [_dateSelectView showBoarder:UIViewBorderLineTypeBottom];
    }
    return _dateSelectView;
}

- (UITextField*) startDateTextField{
    if (!_startDateTextField) {
        _startDateTextField = [self addTextField:@"开始时间"];
        [_startDateTextField setEnabled:NO];
        _startDateTextField.font = [UIFont systemFontOfSize:14];
        _startDateTextField.textColor = [UIColor commonTextColor];
        _startDateTextField.textAlignment = NSTextAlignmentCenter;
    }
    return _startDateTextField;
}

- (UIControl*) startDateControl{
    if (!_startDateControl) {
        _startDateControl = [[UIControl alloc] init];
        [self.dateSelectView addSubview:_startDateControl];
    
        [_startDateControl addTarget:self action:@selector(startDateControlClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _startDateControl;
}

- (UILabel*) midLabel{
    if (!_midLabel) {
        _midLabel = [self addLabel];
        _midLabel.text = @"-";
        _midLabel.font = [UIFont systemFontOfSize:14];
        _midLabel.textColor = [UIColor commonTextColor];
    }
    return _midLabel;
}

- (UITextField*) endDateTextField{
    if (!_endDateTextField) {
        _endDateTextField = [self addTextField:@"结束时间"];
        [_endDateTextField setEnabled:NO];
        _endDateTextField.textAlignment = NSTextAlignmentCenter;
        _endDateTextField.font = [UIFont systemFontOfSize:14];
        _endDateTextField.textColor = [UIColor commonTextColor];
    }
    return _endDateTextField;
}

- (UIControl*) endDateControl{
    if (!_endDateControl) {
        _endDateControl = [[UIControl alloc] init];
        [self.dateSelectView addSubview:_endDateControl];
        
        [_endDateControl addTarget:self action:@selector(endDateControlClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _endDateControl;
}

- (NSDate*) startDate{
    NSString* startDateString = self.startDateTextField.text;
    if (!startDateString || startDateString.length == 0) {
        return nil;
    }
    NSDate* date = [NSDate dateWithString:startDateString format:@"yyyy-MM-dd"];
    return date;
}

- (NSDate*) endDate{
    NSString* endDateString = self.endDateTextField.text;
    if (!endDateString || endDateString.length == 0) {
        return nil;
    }
    NSDate* date = [NSDate dateWithString:endDateString format:@"yyyy-MM-dd"];
    return date;
}

- (UIView*) typeView{
    if (!_typeView) {
        _typeView = [[UIView alloc] init];
        [self.topView addSubview:_typeView];
        [_typeView setBackgroundColor:[UIColor whiteColor]];
        [_typeView showBoarder:UIViewBorderLineTypeBottom];
        
    }
    return _typeView;
}

- (UILabel*) typeLabel{
    if (!_typeLabel) {
        _typeLabel = [self.typeView addLabel];
        _typeLabel.font = [UIFont systemFontOfSize:15];
        _typeLabel.textColor = [UIColor commonTextColor];
        _typeLabel.text = @"全部";
    }
    return _typeLabel;
}

- (UIControl*) typeControl{
    if (!_typeControl) {
        _typeControl = [[UIControl alloc] init];
        [self.typeView addSubview:_typeControl];
        
        [_typeControl addTarget:self action:@selector(typeControlClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _typeControl;
}

- (UIButton*) queryButton{
    if (!_queryButton) {
        _queryButton = [self.typeView addButton:UIButtonTypeCustom];
        [_queryButton setTitle:@"查看" forState:UIControlStateNormal];
        [_queryButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _queryButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_queryButton setBackgroundImage:[UIImage rectImage:[UIColor mainThemeColor] size:CGSizeMake(100, 41)] forState:UIControlStateNormal];
        [_queryButton setCornerRadius:4];
        [_queryButton addTarget:self action:@selector(queryButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _queryButton;
}

- (UIButton*) clearButton{
    if (!_clearButton) {
        _clearButton = [self.typeView addButton:UIButtonTypeCustom];
        [_clearButton setTitle:@"清空" forState:UIControlStateNormal];
        [_clearButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _clearButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_clearButton setBackgroundImage:[UIImage rectImage:[UIColor mainThemeColor] size:CGSizeMake(100, 41)] forState:UIControlStateNormal];
        [_clearButton setCornerRadius:4];
        
        [_clearButton addTarget:self action:@selector(clearButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _clearButton;
}

- (UIView*) statisticView{
    if (!_statisticView) {
        _statisticView = [[UIView alloc] init];
        [self.view addSubview:_statisticView];
        _statisticView.backgroundColor = [UIColor whiteColor];
        [_statisticView showBoarder:UIViewBorderLineTypeBottom];
    }
    return _statisticView;
}

- (UIButton*) statisticButton{
    if (!_statisticButton) {
        _statisticButton = [self.statisticView addButton:UIButtonTypeCustom];
        [_statisticButton setTitle:@"统计" forState:UIControlStateNormal];
        [_statisticButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _statisticButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_statisticButton setBackgroundImage:[UIImage rectImage:[UIColor mainThemeColor] size:CGSizeMake(100, 41)] forState:UIControlStateNormal];
        [_statisticButton setCornerRadius:4];
        
        [_statisticButton addTarget:self action:@selector(statisticsButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _statisticButton;
}

#pragma mark - control event
- (void) startDateControlClicked:(id) sender{
    __weak typeof(self) weakSelf = self;
    [DatePickerViewController showWithDate:self.endDate handler:^(NSString *dateString) {
        if (!weakSelf) {
            return ;
        }
        __strong typeof(self) strongSelf = weakSelf;
        strongSelf.startDateTextField.text = dateString;
    }];
}

- (void) endDateControlClicked:(id) sender{
    __weak typeof(self) weakSelf = self;
    [DatePickerViewController showWithDate:self.endDate handler:^(NSString *dateString) {
        if (!weakSelf) {
            return ;
        }
        __strong typeof(self) strongSelf = weakSelf;
        strongSelf.endDateTextField.text = dateString;
    }];
}

- (void) typeControlClicked:(id) sender{
    __weak typeof(self) weakSelf = self;
    [HistoryTypeSelectViewController showWithHandler:^(HistoryTypeModel *typeModel) {
        if (!weakSelf) {
            return ;
        }
        __strong typeof(self) strongSelf = weakSelf;
        [strongSelf setTypeModel:typeModel];
    }];
}

- (void) setTypeModel:(HistoryTypeModel *)typeModel{
    _typeModel = typeModel;
    self.typeLabel.text = typeModel.typeName;
}

- (void) queryButtonClicked:(id) sender{
    NSString* startDateStr = nil;
    if (self.startDate ) {
        if ([self.startDate compare:[NSDate date]] == NSOrderedDescending) {
            [NSObject showAlert:@"开始时间不能大于今天"];
            return;
        }
        startDateStr = [self.startDate stringWithFormat:@"yyyy-MM-dd"];
    }
    NSString* endDateStr = nil;
    if (self.endDate ) {
        if ([self.endDate compare:[NSDate date]] == NSOrderedDescending) {
            [NSObject showAlert:@"结束时间不能大于今天"];
            return;
        }
        endDateStr = [self.endDate stringWithFormat:@"yyyy-MM-dd"];
    }
    
    if (self.startDate && self.endDate &&
        [self.startDate compare:self.endDate] == NSOrderedDescending) {
        [NSObject showAlert:@"开始时间不能大于结束时间。"];
        return;
    }
    
    
    [self.tableViewController startLoadHistory:self.typeModel.type startDate:startDateStr endDate:endDateStr];
}

- (void) clearButtonClicked:(id) sender{
    self.startDateTextField.text = nil;
    self.endDateTextField.text = nil;
    [self setTypeModel:[HistoryTypeModel typeModel:HistoryType_All]];
    
    [self.tableViewController startLoadRecords];
    
}

- (void) statisticsButtonClicked:(id) sender{
    [StatisticsPageManager entryStaticsticStartPage];
}
@end
