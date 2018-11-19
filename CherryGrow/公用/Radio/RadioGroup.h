//
//  RadioGroup.h
//  CherryGrow
//
//  Created by YinQ on 2018/10/25.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, RadioOrientation) {
    Radio_Horizontal,
    Radio_Vertical,
    
};

@interface RadioGroup : UIView

@property (nonatomic, assign) NSInteger selectedIndex;
@property (nonatomic, assign) BOOL editable;

- (id) initWithTitles:(NSArray<NSString*>*) titles orientation:(RadioOrientation) orientation;
@end
