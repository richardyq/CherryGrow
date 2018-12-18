//
//  BasePageViewController.m
//  CherryGrow
//
//  Created by YinQ on 2018/12/17.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "BasePageViewController.h"

@interface BasePageViewController ()

@property (nonatomic, readonly) NSMutableDictionary* controllerDictionary;


@end

@implementation BasePageViewController

@synthesize controllerId = _controllerId;
@synthesize controllerDictionary = _controllerDictionary;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor commonBackgroundColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSString*) controllerId{
    if (!_controllerId) {
        _controllerId = [self.controllerDictionary mj_JSONString];
    }
    return _controllerId;
}

- (NSMutableDictionary*) controllerDictionary{
    if (!_controllerDictionary) {
        _controllerDictionary = [NSMutableDictionary dictionary];
        [_controllerDictionary setValue:NSStringFromClass(self.class) forKey:@"controllerName"];
        if (self.paramDictionary) {
            [_controllerDictionary setValue:self.paramDictionary forKey:@"param"];
        }
    }
    return _controllerDictionary;
}

@end
