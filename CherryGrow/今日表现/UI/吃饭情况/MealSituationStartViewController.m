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
#import "SituationRequestManager.h"
#import "MealSituation.h"


@interface MealSituationStartViewController ()
<UITableViewDelegate, UITableViewDataSource, MealSituationEditDelegate>
@property (nonatomic, strong) UIView* totalScoreView;
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) NSMutableArray<MealSituation*>* mealSituations;

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
    
    
    [self startLoadTodaySituations];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) layoutElements{
//    [self.totalScoreView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.top.right.equalTo(self.view);
//        make.height.mas_equalTo(@78);
//    }];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.view);
    }];
    
}

- (void) startLoadTodaySituations{
    __weak typeof(self) weakSelf = self;
    [SituationRequestManager createTodayMealSituationRequst:^(id result) {
        if (!weakSelf) {
            return ;
        }
        __strong typeof(self) strongSelf = weakSelf;
        NSArray<MealSituation*>* mealSituations = result;
        [strongSelf setMealSituations:[NSMutableArray<MealSituation*> arrayWithArray:mealSituations]];
    } failed:^(NSInteger errorCode, NSString *message) {
        
    } complete:^(NSInteger errorCode) {
        if (!weakSelf) {
            return ;
        }
        __strong typeof(self) strongSelf = weakSelf;
        if (errorCode == 0) {
            [strongSelf.tableView reloadData];
        }
    }];
  
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
    MealSitatusEditTableViewCell* cell = nil;
    MealSituation* situation = [self mealSituationOfIndex:indexPath.row];
    if (situation) {
        cell = [[MealSitatusEditTableViewCell alloc] initWithMealSituation:situation];
    }
    if (!cell) {
        cell = [[MealSitatusEditTableViewCell alloc] initWithTitle:title];
    }
    [cell setDelegate:self];
    [cell setMealCode:indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (MealSituation*) mealSituationOfIndex:(NSInteger) row{
    __block MealSituation* mealSituation = nil;
    [self.mealSituations enumerateObjectsUsingBlock:^(MealSituation * _Nonnull situation, NSUInteger idx, BOOL * _Nonnull stop) {
        if (situation.code == row) {
            mealSituation = situation;
            *stop = YES;
        }
    }];
    return mealSituation;
}

#pragma mark - MealSituationEditDelegate
- (void) submitMealSituation:(MealSituationParam*) situation{
    __weak typeof(self) weakSelf = self;
    [SituationRequestManager createAddMealSituation:situation.code speed:situation.speed feed:situation.feed amount:situation.amount success:^(id result) {
        if (!weakSelf) {
            return ;
        }
        __strong typeof(self) strongSelf = weakSelf;
       
        MealSituation* situation = (MealSituation*) result;
        [strongSelf.mealSituations addObject:situation];
    } failed:^(NSInteger errorCode, NSString *message) {
        
    } complete:^(NSInteger errorCode) {
        if (errorCode != 0) {
            return ;
        }
        if (!weakSelf) {
            return;
        }
        __strong typeof(self) strongSelf = weakSelf;
        [strongSelf.tableView reloadData];
    }];
}

@end
