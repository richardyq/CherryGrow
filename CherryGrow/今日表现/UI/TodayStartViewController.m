//
//  TodayStartViewController.m
//  CherryGrow
//
//  Created by YinQ on 2018/10/25.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "TodayStartViewController.h"
#import "TagViewController.h"

@interface TodayStartViewController ()

@property (nonatomic, readonly) TagViewController* tagViewController;
@property (nonatomic, readonly) NSArray<UIViewController*>* controllers;

@end

@implementation TodayStartViewController

@synthesize controllers = _controllers;
@synthesize tagViewController = _tagViewController;

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
    [self.tagViewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - settingAndGetting
- (NSArray<UIViewController*>*) controllers{
    if (!_controllers) {
        NSArray<NSString*>* classnames = @[@"MealSituationStartViewController", @"SleepSituationStartViewController", @"InterestSituationStartViewController"];
        
        NSMutableArray<UIViewController*>* controllers = [NSMutableArray<UIViewController*> array];
        [classnames enumerateObjectsUsingBlock:^(NSString * _Nonnull classname, NSUInteger idx, BOOL * _Nonnull stop) {
            UIViewController* controller = [[NSClassFromString(classname) alloc] init];
            [controllers addObject:controller];
        }];
        _controllers = [NSArray<UIViewController*> arrayWithArray:controllers];
    }
    return _controllers;
}

- (TagViewController*) tagViewController{
    if (!_tagViewController) {
        _tagViewController = [[TagViewController alloc] init];
        [self addChildViewController:_tagViewController];
        [self.view addSubview:_tagViewController.view];
        
        _tagViewController.controllers = self.controllers;
    }
    return _tagViewController;
}

@end
