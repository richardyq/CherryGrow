//
//  BasePageViewController.h
//  CherryGrow
//
//  Created by YinQ on 2018/12/17.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BasePageViewController : UIViewController

@property (nonatomic, readonly) NSString* controllerId;
@property (nonatomic, readonly) NSDictionary* paramDictionary;
@end
