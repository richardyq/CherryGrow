//
//  RadioGroup.m
//  CherryGrow
//
//  Created by YinQ on 2018/10/25.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "RadioGroup.h"
#import "RadioButton.h"



@interface RadioGroup ()

@property (nonatomic, readonly) NSArray<RadioButton*>* radioButtons;
@property (nonatomic, readonly) RadioOrientation orientation;
@end

@implementation RadioGroup
@synthesize selectedIndex = _selectedIndex;

- (id) initWithTitles:(NSArray<NSString*>*) titles orientation:(RadioOrientation) orientation{
    self = [super init];
    if (self) {
        _orientation = orientation;
        _radioButtons = [self createButtons:titles];
        _editable = YES;
        [self layoutElements];
    }
    return self;
}

- (NSArray<RadioButton*>*) createButtons:(NSArray<NSString*>*) titles{
    NSMutableArray<RadioButton*>* buttons = [NSMutableArray<RadioButton*> array];
    [titles enumerateObjectsUsingBlock:^(NSString * _Nonnull title, NSUInteger idx, BOOL * _Nonnull stop) {
        RadioButton* radioButton = [[RadioButton alloc] initWithTitle:title];
        [self addSubview:radioButton];
        [buttons addObject:radioButton];
        
        radioButton.selected = (idx == _selectedIndex);
        
        [radioButton addTarget:self action:@selector(radioButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }];
    
    return  [NSArray<RadioButton*> arrayWithArray:buttons];
}

- (void) layoutElements{
    switch (self.orientation) {
        case Radio_Horizontal:
        {
            __block MASViewAttribute* radioLeft = self.mas_left;
            __block MASViewAttribute* radioWidth = nil;
            [self.radioButtons enumerateObjectsUsingBlock:^(RadioButton * _Nonnull radio, NSUInteger idx, BOOL * _Nonnull stop) {
                [radio mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.bottom.equalTo(self);
                    make.left.equalTo(radioLeft);
                    if (radioWidth) {
                        make.width.equalTo(radioWidth);
                    }
                    
                    if (radio == self.radioButtons.lastObject) {
                        make.right.equalTo(self);
                    }
                }];
                
                radioLeft = radio.mas_right;
                radioWidth = radio.mas_width;
            }];
            break;
        }
        case Radio_Vertical:
        {
            __block MASViewAttribute* radioTop = self.mas_top;
            __block MASViewAttribute* radioHeight = nil;
            [self.radioButtons enumerateObjectsUsingBlock:^(RadioButton * _Nonnull radio, NSUInteger idx, BOOL * _Nonnull stop) {
                [radio mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.right.equalTo(self);
                    make.top.equalTo(radioTop);
                    if (radioHeight) {
                        make.width.equalTo(radioHeight);
                    }
                    
                    if (radio == self.radioButtons.lastObject) {
                        make.bottom.equalTo(self);
                    }
                }];
                
                radioTop = radio.mas_bottom;
                radioHeight = radio.mas_height;
            }];
            break;
            break;
        }
    }
}

- (void) radioButtonClicked:(RadioButton*) radioButton{
    if (!self.editable) {
        return;
    }
    if (![radioButton isKindOfClass:[RadioButton class]]) {
        return;
    }
    NSInteger selectedIndex = [self.radioButtons indexOfObject:radioButton];
    if (selectedIndex == NSNotFound ) {
        return;
    }
    [self setSelectedIndex:selectedIndex];
}

#pragma mark setttingAndGetting
- (NSInteger) selectedIndex{
    __block NSInteger selectedIndex = NSNotFound;
    [self.radioButtons enumerateObjectsUsingBlock:^(RadioButton * _Nonnull button, NSUInteger idx, BOOL * _Nonnull stop) {
        if (button.selected) {
            selectedIndex = idx;
            *stop = YES;
        }
    }];
    _selectedIndex = selectedIndex;
    return selectedIndex;
}

- (void) setSelectedIndex:(NSInteger)selectedIndex{
    if (selectedIndex < 0 || selectedIndex >= self.radioButtons.count) {
        return;
    }
    _selectedIndex = selectedIndex;
    [self.radioButtons enumerateObjectsUsingBlock:^(RadioButton * _Nonnull button, NSUInteger idx, BOOL * _Nonnull stop) {
        [button setSelected:(selectedIndex == idx)];
    }];
}
@end
