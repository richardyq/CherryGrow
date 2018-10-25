//
//  UIView+BoarderExt.m
//  CherryGrow
//
//  Created by YinQ on 2018/10/24.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "UIView+BoarderExt.h"

static NSInteger const topLineTag = 0x3950;
static NSInteger const leftLineTag = topLineTag + 1;
static NSInteger const bottomLineTag = leftLineTag + 1;
static NSInteger const rightLineTag = bottomLineTag + 1;

@implementation UIView (BoarderExt)

- (void) showBoarder{
    self.layer.borderColor = [UIColor commonControlBorderColor].CGColor;
    self.layer.borderWidth = 0.5;
    self.layer.masksToBounds = YES;
}

- (void) showBoarder:(UIViewBorderLineType) boarderType{
    NSInteger lineTag = topLineTag;
    switch (boarderType) {
        case UIViewBorderLineTypeTop:
            lineTag = topLineTag;
            break;
        case UIViewBorderLineTypeLeft:
            lineTag = leftLineTag;
            break;
        case UIViewBorderLineTypeBottom:
            lineTag = bottomLineTag;
            break;
        case UIViewBorderLineTypeRight:
            lineTag = rightLineTag;
            break;
        
    }
    
    UIView* lineView = [self viewWithTag:lineTag];
    if (lineView) {
        return;
    }
    
    lineView = [UIView new];
    lineView.tag = lineTag;
    [self addSubview:lineView];
    lineView.backgroundColor = [UIColor commonControlBorderColor];
    
    switch (boarderType) {
        case UIViewBorderLineTypeTop:
        {
            [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self);
                make.left.right.equalTo(self);
                make.height.mas_equalTo(@0.5);
            }];
            break;
        }
        
        case UIViewBorderLineTypeLeft:
        {
            [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self);
                make.top.bottom.equalTo(self);
                make.width.mas_equalTo(@0.5);
            }];
            break;
        }
        case UIViewBorderLineTypeRight: {
            [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(self);
                make.top.bottom.equalTo(self);
                make.width.mas_equalTo(@0.5);
            }];
            break;
        }
        case UIViewBorderLineTypeBottom: {
            [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(self);
                make.left.right.equalTo(self);
                make.height.mas_equalTo(@0.5);
            }];
            break;
        }
    }
}

- (void) setCornerRadius:(CGFloat) radius{
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
}

- (void) setCornerRadius:(CGFloat) radius color:(UIColor*) color boarderwidth:(CGFloat) boarderwidth{
    self.layer.cornerRadius = radius;
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = boarderwidth;
    self.layer.masksToBounds = YES;
}

@end
