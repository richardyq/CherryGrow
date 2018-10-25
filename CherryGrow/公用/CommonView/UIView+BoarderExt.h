//
//  UIView+BoarderExt.h
//  CherryGrow
//
//  Created by YinQ on 2018/10/24.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, UIViewBorderLineType) {
    UIViewBorderLineTypeTop,
    UIViewBorderLineTypeRight,
    UIViewBorderLineTypeBottom,
    UIViewBorderLineTypeLeft,
};

@interface UIView (BoarderExt)



- (void) showBoarder;

- (void) showBoarder:(UIViewBorderLineType) boarderType;

- (void) setCornerRadius:(CGFloat) radius;

- (void) setCornerRadius:(CGFloat) radius color:(UIColor*) color boarderwidth:(CGFloat) boarderwidth;

@end
