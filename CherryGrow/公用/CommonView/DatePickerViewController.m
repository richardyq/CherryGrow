//
//  DatePickerViewController.m
//  CherryGrow
//
//  Created by YinQ on 2018/12/5.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()

@property (nonatomic, strong) UIDatePicker* picker;
@property (nonatomic, strong) UIToolbar* toolbar;
@property (nonatomic, strong) NSArray<UIBarButtonItem*>* barItems;

@property (nonatomic, strong) DatePickerHandler pickerHandler;
@end

@implementation DatePickerViewController

+ (void) showWithDate:(NSDate*) date handler:(DatePickerHandler) handler{
    DatePickerViewController* controller = (DatePickerViewController*)[DatePickerViewController show];
    if (date) {
        [controller.picker setDate:date];
    }
    controller.pickerHandler = handler;
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
- (UIDatePicker*) picker{
    if (!_picker) {
        _picker = [[UIDatePicker alloc] init];
        [_picker setBackgroundColor:[UIColor whiteColor]];
        _picker.datePickerMode = UIDatePickerModeDate;
        [self.view addSubview:_picker];
    }
    return _picker;
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
    
    if (self.pickerHandler) {
        NSString* dateString = [self.picker.date stringWithFormat:@"yyyy-MM-dd"];
        self.pickerHandler(dateString);
    };
}
@end
