//
//  MealSituationStartViewController.m
//  CherryGrow
//
//  Created by YinQ on 2018/10/25.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "MealSituationStartViewController.h"

#import "MealSituationEditView.h"
#import "MealSitatusEditTableViewCell.h"

@interface MealSituationStartViewController ()
<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UIView* totalScoreView;
@property (nonatomic, strong) UITableView* tableView;

/*
@property (nonatomic, strong) MealSituationEditView* breakfastSituationView;
@property (nonatomic, strong) MealSituationEditView* lunchSituationView;
@property (nonatomic, strong) MealSituationEditView* dinnerSituationView;
*/
@end

typedef NS_ENUM(NSUInteger, MealIndex) {
    Meal_Breakfast,
    Meal_Lunch,
    Meal_Dinner,
    Meal_Count,
};

@implementation MealSituationStartViewController



- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"吃饭情况";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor commonBackgroundColor]];
    
    [self layoutElements];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) layoutElements{
    [self.totalScoreView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.view);
        make.height.mas_equalTo(@78);
    }];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.totalScoreView.mas_bottom).offset(12);
    }];
    /*
    [self.breakfastSituationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.totalScoreView.mas_bottom).offset(12);
        make.centerX.equalTo(self.view);
        make.width.equalTo(self.view).offset(-25);
    }];
    
    [self.lunchSituationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.breakfastSituationView.mas_bottom).offset(12);
        make.centerX.equalTo(self.view);
        make.width.equalTo(self.view).offset(-25);
    }];
    
    [self.dinnerSituationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lunchSituationView.mas_bottom).offset(12);
        make.centerX.equalTo(self.view);
        make.width.equalTo(self.view).offset(-25);
    }];
     */
}


#pragma mark - settingAndGetting

- (UIView*) totalScoreView{
    if (!_totalScoreView) {
        _totalScoreView = [UIView new];
        [_totalScoreView setBackgroundColor:[UIColor whiteColor]];
        [self.view addSubview:_totalScoreView];
    }
    return _totalScoreView;
}

- (UITableView*) tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

#pragma mark - tableview datasource
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return Meal_Count;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString* title = @"";
    switch (indexPath.row) {
        case Meal_Breakfast:
            title = @"早餐";
            break;
        case Meal_Lunch:
            title = @"午餐";
            break;
        case Meal_Dinner:
            title = @"晚餐";
            break;
        default:
            break;
    }
    MealSitatusEditTableViewCell* cell = [[MealSitatusEditTableViewCell alloc] initWithTitle:title];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

/*
- (MealSituationEditView*) breakfastSituationView{
    if (!_breakfastSituationView) {
        _breakfastSituationView = [[MealSituationEditView alloc] initWithTitle:@"早餐"];
        [self.view addSubview:_breakfastSituationView];
    }
    return _breakfastSituationView;
}

- (MealSituationEditView*) lunchSituationView{
    if (!_lunchSituationView) {
        _lunchSituationView = [[MealSituationEditView alloc] initWithTitle:@"午餐"];
        [self.view addSubview:_lunchSituationView];
    }
    return _lunchSituationView;
}

- (MealSituationEditView*) dinnerSituationView{
    if (!_dinnerSituationView) {
        _dinnerSituationView = [[MealSituationEditView alloc] initWithTitle:@"晚餐"];
        [self.view addSubview:_dinnerSituationView];
    }
    return _dinnerSituationView;
}
 */
@end
