//
//  TodaySituationViewController.m
//  CherryGrow
//
//  Created by YinQ on 2018/12/4.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "TodaySituationViewController.h"

@interface TodaySituationViewController ()



@end


@implementation TodaySituationViewController

@synthesize loadSituationTime = _loadSituationTime;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[self startLoadTodayStatus];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    if ([self needLoadStatus]) {
        [self startLoadTodaySittuations];
    }
}

- (BOOL) needLoadStatus{
    BOOL needLoadStatus = NO;
    
    if (!self.loadSituationTime) {
        needLoadStatus = YES;
        return needLoadStatus;
    }
    
    NSTimeInterval timeInterval = [[NSDate date] timeIntervalSinceDate:self.loadSituationTime];
    needLoadStatus = (timeInterval > 60 * 60);
    
    return needLoadStatus;
}

- (void) startLoadTodaySittuations{
    [SVProgressHUD setStatus:@"请等待。。。"];
    [self loadToadySituation];
}

- (void) loadToadySituation{
    
}

- (void) todaySituationsLoaded{
    _loadSituationTime = [NSDate date];
    [SVProgressHUD dismiss];
}

- (void) todaySituationsLoadFailed{
    [SVProgressHUD dismiss];
}

- (NSDate*) loadSituationTime{
    return _loadSituationTime;
}



@end
