//
//  HistoryTypeSelectViewController.m
//  CherryGrow
//
//  Created by YinQ on 2018/12/5.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "HistoryTypeSelectViewController.h"


@interface HistoryTypeSelectViewController ()
<UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) UIPickerView* picker;
@property (nonatomic, strong) NSArray<HistoryTypeModel*>* typeModels;

@property (nonatomic, strong) UIToolbar* toolbar;
@property (nonatomic, strong) NSArray<UIBarButtonItem*>* barItems;

@property (nonatomic, strong) TypeSelectHandler pickerHandler;
@end

@implementation HistoryTypeSelectViewController

+ (HistoryTypeSelectViewController*) showWithHandler:(TypeSelectHandler)handler{
    HistoryTypeSelectViewController* controller = (HistoryTypeSelectViewController*) [HistoryTypeSelectViewController show];
    [controller setPickerHandler:handler];
    return controller;
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
    [self.picker mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
    }];
    
    [self.toolbar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.picker.mas_top);
    }];
}

#pragma mark - settingAndGetting
- (UIPickerView*) picker{
    if (!_picker) {
        _picker = [[UIPickerView alloc] init];
        [_picker setBackgroundColor:[UIColor whiteColor]];
        _picker.dataSource = self;
        _picker.delegate = self;
        [self.view addSubview:_picker];
    }
    return _picker;
}

- (NSArray<HistoryTypeModel*>*) typeModels{
    if (!_typeModels) {
        NSMutableArray<HistoryTypeModel*>* models = [NSMutableArray<HistoryTypeModel*> array];
        [models addObject:[HistoryTypeModel typeModel:HistoryType_All]];
        [models addObject:[HistoryTypeModel typeModel:HistoryType_Meal]];
        [models addObject:[HistoryTypeModel typeModel:HistoryType_Sleep]];
        [models addObject:[HistoryTypeModel typeModel:HistoryType_Interest]];
        
        _typeModels = [NSArray<HistoryTypeModel*> arrayWithArray:models];
    }
    return _typeModels;
}

- (UIToolbar*) toolbar{
    if (!_toolbar) {
        _toolbar = [UIToolbar new];
        [self.view addSubview:_toolbar];
        
        [_toolbar setItems:self.barItems];
    }
    return _toolbar;
}

- (NSArray<UIBarButtonItem*>*) barItems{
    if (!_barItems) {
        NSMutableArray<UIBarButtonItem*>* items = [NSMutableArray<UIBarButtonItem*> array];
        
        UIBarButtonItem* cancelItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelItemClicked)];
        //        UITabBarItem* spaceItem = [[UIBarButtonItem alloc] init];
        UIBarButtonItem* spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        UIBarButtonItem* confirmItem = [[UIBarButtonItem alloc] initWithTitle:@"确认" style:UIBarButtonItemStylePlain target:self action:@selector(confirmItemClicked)];;
        [items addObject:cancelItem];
        [items addObject:spaceItem];
        [items addObject:confirmItem];
        _barItems = [NSArray<UIBarButtonItem*> arrayWithArray:items];
    }
    return _barItems;
}

- (void) cancelItemClicked{
    [self closeController];
}

- (void) confirmItemClicked{
    [self closeController];
    
    NSInteger row = [self.picker selectedRowInComponent:0];
    HistoryTypeModel* model = self.typeModels[row];
    
    if (self.pickerHandler) {
        self.pickerHandler(model);
    }
}
#pragma mark - UIPickerViewDataSource
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return self.typeModels.count;
}

- (NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    HistoryTypeModel* model = self.typeModels[row];
    return model.typeName;
}
@end
