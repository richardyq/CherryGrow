//
//  PageViewControllerManager.m
//  CherryGrow
//
//  Created by YinQ on 2018/10/24.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "PageViewControllerManager.h"
#import "UserLoginViewController.h"

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
@end
