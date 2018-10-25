//
//  NSObject+RootControllerExt.h
//  CherryGrow
//
//  Created by YinQ on 2018/10/24.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface NSObject (RootControllerExt)

+ (id<UIApplicationDelegate>) rootApp;

+ (UIWindow*) rootWindow;

+ (BOOL) isPad;

- (UIViewController*) topMostController;

@end
