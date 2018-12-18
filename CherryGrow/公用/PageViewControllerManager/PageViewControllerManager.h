//
//  PageViewControllerManager.h
//  CherryGrow
//
//  Created by YinQ on 2018/10/24.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseNavigationController.h"
#import "BasePageViewController.h"

@interface PageViewControllerManager : NSObject

+ (PageViewControllerManager*) defaultManager;

- (void) entryUserLoginPage;

- (void) entryMainStartPage;

- (void) createPageController:(BasePageViewController*) controller;
@end
