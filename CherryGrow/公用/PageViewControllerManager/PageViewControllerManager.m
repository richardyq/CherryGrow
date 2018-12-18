//
//  PageViewControllerManager.m
//  CherryGrow
//
//  Created by YinQ on 2018/10/24.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "PageViewControllerManager.h"
#import "UserLoginViewController.h"
#import "MainStartViewController.h"
#import "BasePageViewController.h"

static PageViewControllerManager* defaultManager = nil;

@implementation PageViewControllerManager

+ (PageViewControllerManager*) defaultManager{
    if (!defaultManager) {
        defaultManager = [PageViewControllerManager new];
    }
    return defaultManager;
}

- (void) entryUserLoginPage{
    UserLoginViewController* loginController = [[UserLoginViewController alloc] initWithNibName:nil bundle:nil];
    
    [[NSObject rootWindow] setRootViewController:loginController];
}

- (void) entryMainStartPage{
    MainStartViewController* startController = [[MainStartViewController alloc] initWithNibName:nil bundle:nil];
    [[NSObject rootWindow] setRootViewController:startController];
}

- (void) createPageController:(BasePageViewController*) controller{
    UINavigationController* navigationController = [NSObject topMostController].navigationController;
    if (!controller) {
        return;
    }
    
    if (!navigationController) {
        return;
    }
    
    __block BasePageViewController* existedViewController = nil;
    [navigationController.viewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull viewController, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([viewController isKindOfClass:[BasePageViewController class]]) {
            BasePageViewController* pageViewController = (BasePageViewController*) viewController;
            if ([pageViewController.controllerId isEqualToString:controller.controllerId]) {
                existedViewController = pageViewController;
                *stop = YES;
                return ;
            }
        }
    }];
    
    if (existedViewController) {
        [navigationController popToViewController:existedViewController animated:YES];
        return;
    }
    
    [navigationController pushViewController:controller animated:YES];
}
@end
