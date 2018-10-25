//
//  InitializationViewController.m
//  CherryGrow
//
//  Created by YinQ on 2018/10/24.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "InitializationViewController.h"
#import "InitializationUtil.h"

@interface InitializationViewController ()
@property (nonatomic, strong) InitializationUtil* initializeUtil;

@end

@implementation InitializationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self performSelector:@selector(startInitialize) withObject:nil afterDelay:0.3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) startInitialize{
    [self.initializeUtil startInitialize];
}

#pragma mark - settingAndGetting
- (InitializationUtil*) initializeUtil{
    if (!_initializeUtil) {
        _initializeUtil = [InitializationUtil new];
    }
    return _initializeUtil;
}
@end
