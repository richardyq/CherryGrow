//
//  BaseNavigationController.m
//  CherryGrow
//
//  Created by YinQ on 2018/10/25.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "BaseNavigationController.h"

@interface UIBarButtonItem (BackExtension)

+ (UIBarButtonItem *)itemWithImageNamed:(NSString *)imageNamed targe:(id)targe action:(SEL)action;

@end


@implementation UIBarButtonItem (BackExtension)

+ (UIBarButtonItem *)itemWithImageNamed:(NSString *)imageNamed targe:(id)targe action:(SEL)action
{
    UIButton *button = [[UIButton alloc] init];
    [button setBackgroundImage:[UIImage imageNamed:imageNamed] forState:UIControlStateNormal];
    
    button.frame = CGRectMake(0, 0, button.currentBackgroundImage.size.width, button.currentBackgroundImage.size.height);
    
    [button addTarget:targe action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

@end

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationBar setBarTintColor:[UIColor mainThemeColor]];
    self.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor], NSFontAttributeName:[UIFont boldSystemFontOfSize:18]}];
    [self.navigationBar setTranslucent:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{   //拦截所有push进来的子控制器
    if(self.viewControllers.count > 0)
    {
        viewController.hidesBottomBarWhenPushed = YES;
        
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageNamed:@"backArrow" targe:self action:@selector(backUp)];
        
    }
    [super pushViewController:viewController animated:animated];
    
}

- (void)backUp
{
    [self popViewControllerAnimated:YES];
}

@end
