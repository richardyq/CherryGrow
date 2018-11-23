//
//  MealSituationEditView.m
//  CherryGrow
//
//  Created by YinQ on 2018/10/26.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "MealSituationEditView.h"
#import "RadioGroup.h"


@interface MealSituationEditView ()

@property (nonatomic, strong) UILabel* titleLabel;

@property (nonatomic, strong) UILabel* askHelpLabel;
@property (nonatomic, strong) RadioGroup* askHelpRadioGroup;

@property (nonatomic, strong) UILabel* speedLabel;
@property (nonatomic, strong) RadioGroup* speedRadioGroup;

@property (nonatomic, strong) UILabel* amountLabel;
@property (nonatomic, strong) RadioGroup* amountRadioGroup;

@property (nonatomic, strong) UIButton* submitButton;
@property (nonatomic, strong) UILabel* scoreLabel;
@property (nonatomic, strong) UILabel* editLabel;

@end

@implementation MealSituationEditView

- (id) initWithTitle:(NSString*) title{
    self = [super init];
    if (self) {
        [self setBackgroundColor:[UIColor whiteColor]];
        [self setCornerRadius:5];
        
        self.titleLabel.text = title;
        
        self.submitButton.hidden = NO;
        self.scoreLabel.hidden = YES;
        self.editLabel.hidden = YES;
        [self layoutElements];
       
    }
    return self;
}

- (void) layoutElements{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(12.5);
        make.top.equalTo(self).offset(10);
    }];
    
    [self.askHelpLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(15);
    }];
    
    [self.askHelpRadioGroup mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.askHelpLabel.mas_right).offset(10);
        make.right.equalTo(self).offset(-10);
        make.height.mas_equalTo(30);
        make.centerY.equalTo(self.askHelpLabel);
    }];
    
    [self.speedLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.askHelpLabel);
        make.top.equalTo(self.askHelpRadioGroup.mas_bottom).offset(15);
    }];
    
    [self.speedRadioGroup mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.speedLabel.mas_right).offset(10);
        make.right.equalTo(self).offset(-10);
        make.height.mas_equalTo(30);
        make.centerY.equalTo(self.speedLabel);
    }];
    
    [self.amountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.speedLabel);
        make.top.equalTo(self.speedRadioGroup.mas_bottom).offset(15);
    }];
    
    [self.amountRadioGroup mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.amountLabel.mas_right).offset(10);
        make.right.equalTo(self).offset(-10);
        make.height.mas_equalTo(30);
        make.centerY.equalTo(self.amountLabel);
//        make.bottom.equalTo(self).offset(-12);
    }];
    
    [self.submitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(150, 35));
        make.top.equalTo(self.amountRadioGroup.mas_bottom).offset(7);
        make.centerX.equalTo(self);
        make.bottom.equalTo(self).offset(-12);
    }];
    
    [self.scoreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-12);
//        make.top.equalTo(self.amountRadioGroup.mas_bottom).offset(7);
        make.bottom.equalTo(self.titleLabel);
    }];
    
    [self.editLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).offset(-12);
        make.right.equalTo(self).offset(-12);
    }];
}

- (void) setMealSituation:(MealSituation*) situation{
    self.submitButton.hidden = YES;
    self.scoreLabel.hidden = NO;
    self.editLabel.hidden = NO;
    
    [self.askHelpRadioGroup setSelectedIndex:situation.feed];
    self.askHelpRadioGroup.editable = NO;
    [self.speedRadioGroup setSelectedIndex:situation.speed];
    self.speedRadioGroup.editable = NO;
    [self.amountRadioGroup setSelectedIndex:situation.amount];
    self.amountRadioGroup.editable = NO;
    
    self.scoreLabel.text = [NSString stringWithFormat:@"得分: %.1f", situation.score];
    
    self.editLabel.text = [NSString stringWithFormat:@"%@ %@", situation.userName, situation.updateTime];
}
#pragma mark - settingAndGetting
- (UILabel*) titleLabel{
    if (!_titleLabel) {
        _titleLabel = [self addLabel];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = [UIColor commonTextColor];
    }
    return _titleLabel;
}

- (UILabel*) askHelpLabel{
    if (!_askHelpLabel) {
        _askHelpLabel = [self addLabel];
        _askHelpLabel.font = [UIFont systemFontOfSize:13];
        _askHelpLabel.textColor = [UIColor commonTextColor];
        _askHelpLabel.text = @"自己吃：";
    }
    return _askHelpLabel;
}

- (RadioGroup*) askHelpRadioGroup{
    if (!_askHelpRadioGroup) {
        _askHelpRadioGroup = [[RadioGroup alloc] initWithTitles:@[@"要人喂", @"喂一半", @"自己吃"]  orientation:Radio_Horizontal];
        [self addSubview:_askHelpRadioGroup];
    }
    return _askHelpRadioGroup;
}

- (UILabel*) speedLabel{
    if (!_speedLabel) {
        _speedLabel = [self addLabel];
        _speedLabel.font = [UIFont systemFontOfSize:13];
        _speedLabel.textColor = [UIColor commonTextColor];
        _speedLabel.text = @"吃饭速度：";
    }
    return _speedLabel;
}

- (RadioGroup*) speedRadioGroup{
    if (!_speedRadioGroup) {
        _speedRadioGroup = [[RadioGroup alloc] initWithTitles:@[@"慢", @"一般", @"快"]  orientation:Radio_Horizontal];
        [self addSubview:_speedRadioGroup];
    }
    return _speedRadioGroup;
}

- (UILabel*) amountLabel{
    if (!_amountLabel) {
        _amountLabel = [self addLabel];
        _amountLabel.font = [UIFont systemFontOfSize:13];
        _amountLabel.textColor = [UIColor commonTextColor];
        _amountLabel.text = @"饭量：";
    }
    return _amountLabel;
}

- (RadioGroup*) amountRadioGroup{
    if (!_amountRadioGroup) {
        _amountRadioGroup = [[RadioGroup alloc] initWithTitles:@[@"很少", @"较少", @"合适"]  orientation:Radio_Horizontal];
        [self addSubview:_amountRadioGroup];
    }
    return _amountRadioGroup;
}

- (UIButton*) submitButton{
    if (!_submitButton) {
        _submitButton = [self addButton:UIButtonTypeCustom];
        UIImage* bgImage = [UIImage rectImage:[UIColor mainThemeColor] size:CGSizeMake(200, 45)];
        [_submitButton setBackgroundImage:bgImage forState:UIControlStateNormal];
        
        [_submitButton setTitle:@"提交" forState:UIControlStateNormal];
        [_submitButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
        [_submitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_submitButton setCornerRadius:4.5];
        
        [_submitButton addTarget:self action:@selector(submitButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _submitButton;
}

- (UILabel*) scoreLabel{
    if (!_scoreLabel) {
        _scoreLabel = [self addLabel];
        _scoreLabel.font = [UIFont systemFontOfSize:14];
        _scoreLabel.textColor = [UIColor commonTextColor];
    }
    return _scoreLabel;
}

- (UILabel*) editLabel{
    if (!_editLabel) {
        _editLabel = [self addLabel];
        
        _editLabel.font = [UIFont systemFontOfSize:12];
        _editLabel.textColor = [UIColor commonGrayTextColor];
    }
    return _editLabel;
    
}

#pragma mark - button events
- (void) submitButtonClicked:(id) sender{
    MealSituationParam* situation = [MealSituationParam new];
    situation.speed = self.speedRadioGroup.selectedIndex;
    situation.feed = self.askHelpRadioGroup.selectedIndex;
    situation.amount = self.amountRadioGroup.selectedIndex;
    situation.code = self.mealCode;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(submitMealSituation:)])
    {
        [self.delegate submitMealSituation:situation];
    }
}
@end
