//
//  PopViewController.m
//  CherryGrow
//
//  Created by YinQ on 2018/11/21.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "PopViewController.h"

@interface PopViewController ()

@end

@implementation PopViewController

+ (PopViewController*) show{
    PopViewController* contoller = [[self alloc] init];
    UIViewController* topmostController = [NSObject topMostController];
    [topmostController addChildViewController:contoller];
    [topmostController.view addSubview:contoller.view];
    
    [contoller.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(topmostController.view);
    }];
    
    return contoller;
}

- (void) loadView{
    UIControl* closeControl = [[UIControl alloc] init];
    closeControl.backgroundColor = [UIColor commonTranseColor];
    [self setView:closeControl];
    [closeControl addTarget:self action:@selector(closeController) forControlEvents:UIControlEventAllTouchEvents];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) closeController{
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
}



@end
