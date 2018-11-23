//
//  InterestCateSelectViewController.m
//  CherryGrow
//
//  Created by YinQ on 2018/11/21.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "InterestCateSelectViewController.h"
#import "SituationRequestManager.h"
#import "InterestCateModel.h"

@interface InterestCateSelectViewController ()

@property (nonatomic, readonly) NSArray<InterestCateModel*>* cateModels;
@end

@implementation InterestCateSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadInterestCates];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) loadInterestCates{
    __weak typeof(self) weakSelf = self;
    [SituationRequestManager createInterestCatesRequest:^(id result) {
        if (!result || ![result isKindOfClass:[NSArray<InterestCateModel*> class]]) {
            return ;
        }
        if (!weakSelf) {
            return ;
        }
        __strong typeof(self) strongSelf = weakSelf;
        [strongSelf interestCatesLoaded:result];
    } failed:^(NSInteger errorCode, NSString *message) {
        
    } complete:^(NSInteger errorCode) {
        if (!weakSelf) {
            return ;
        }
        __strong typeof(self) strongSelf = weakSelf;
        if (errorCode == 0) {
            [strongSelf createCatePicker];
        }
    }];
}

- (void) interestCatesLoaded:(NSArray<InterestCateModel*>*) models{
    _cateModels = models;
}

- (void) createCatePicker{
    
}

@end
