//
//  HistoryStartViewController.m
//  CherryGrow
//
//  Created by YinQ on 2018/11/26.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "HistoryStartViewController.h"
#import "HistoryTypeSelectViewController.h"

@interface HistoryStartViewController ()
<UITextFieldDelegate>
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
    [self.dateSelectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.height.mas_equalTo(@47);
    }];
    
    [self.midLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.dateSelectView);
    }];
    
    [self.startDateTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.dateSelectView).offset(15);
        make.height.equalTo(self.dateSelectView).offset(-12);
        make.right.equalTo(self.midLabel.mas_right).offset(-10);
        make.centerY.equalTo(self.dateSelectView);
    }];
    
    [self.startDateControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.startDateTextField);
    }];
    
    [self.endDateTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.dateSelectView).offset(-15);
        make.height.equalTo(self.dateSelectView).offset(-12);
        make.left.equalTo(self.midLabel.mas_right).offset(10);
        make.centerY.equalTo(self.dateSelectView);
    }];
    
    [self.endDateControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.endDateTextField);
    }];
    
    [self.typeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.dateSelectView.mas_bottom);
        make.height.mas_equalTo(@47);
    }];
    
    [self.tableViewController.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.typeView.mas_bottom);
    }];
    
    [self.typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.typeView);
    }];
    
    [self.typeControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.typeView);
        make.size.mas_equalTo(CGSizeMake(160, 40));
    }];
    
    [self.queryButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.typeControl.mas_right).offset(14);
        make.right.equalTo(self.typeView).offset(-15);
        make.centerY.equalTo(self.typeView);
        make.height.equalTo(self.typeView).offset(-12);
    }];
    
    [self.clearButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.typeControl.mas_left).offset(-14);
        make.left.equalTo(self.typeView).offset(15);
        make.centerY.equalTo(self.typeView);
        make.height.equalTo(self.typeView).offset(-12);
    }];
}

#pragma mark - settingAndGetting
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
        [self.view addSubview:_dateSelectView];
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
    if (!startDateString) {
        return nil;
    }
    NSDate* date = [NSDate dateWithString:startDateString format:@"yyyy-MM-dd"];
    return date;
}

- (NSDate*) endDate{
    NSString* endDateString = self.endDateTextField.text;
    if (!endDateString) {
        return nil;
    }
    NSDate* date = [NSDate dateWithString:endDateString format:@"yyyy-MM-dd"];
    return date;
}

- (UIView*) typeView{
    if (!_typeView) {
        _typeView = [[UIView alloc] init];
        [self.view addSubview:_typeView];
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
    }
    return _clearButton;
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
@end
