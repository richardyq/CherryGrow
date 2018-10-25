//
//  TagViewController.h
//  YYCommon
//
//  Created by YinQ on 2018/8/8.
//

#import <UIKit/UIKit.h>
#import "TagView.h"

@interface TagViewController : UIViewController

@property (nonatomic, strong) NSArray<UIViewController*>* controllers;

@property (nonatomic, strong) UIColor* selectTagColor;

@end
