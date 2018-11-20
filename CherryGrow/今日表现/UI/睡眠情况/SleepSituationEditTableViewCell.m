//
//  SleepSituationEditTableViewCell.m
//  CherryGrow
//
//  Created by YinQ on 2018/11/20.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "SleepSituationEditTableViewCell.h"
#import "SleepSituation.h"
#import "RadioGroup.h"

@interface SleepSituation (TableCell)

- (NSString*) title;
@end

@implementation SleepSituation (TableCell)

- (NSString*) title{
    NSString* title = @"睡觉";
    switch (self.code) {
        case 0:
            title = @"中午";
            break;
        case 1:
            title = @"晚上";
            break;
        default:
            break;
    }
    return title;
}
@end

@interface SleepSituationEditTableViewCell ()

@property (nonatomic, readonly) SleepSituation* situation;

@property (nonatomic, strong) UIView* editView;
@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UILabel* sleepTimeLable;
@property (nonatomic, strong) RadioGroup* sleepTimeGroup;

@property (nonatomic, strong) UIButton* submitButton;
@property (nonatomic, strong) UILabel* scoreLabel;
@end

@implementation SleepSituationEditTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id) initWithSituation:(SleepSituation*) situation{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SleepSituationEditTableViewCell"];
    if (self) {
        _situation = situation;
        [self.contentView setBackgroundColor:[UIColor commonBackgroundColor]];
        [self layoutElements];
        self.submitButton.hidden =(situation.id.length != 0) ;
        self.scoreLabel.hidden = (situation.id.length == 0);
        
        if (situation.id.length > 0) {
            [self.sleepTimeGroup setSelectedIndex:situation.status];
            self.sleepTimeGroup.editable = NO;
        }
    }
    return self;
}

- (void) layoutElements{
    [self.editView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(10, 11, 10, 11));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(15);
        make.top.equalTo(self.editView).offset(12);
    }];
    
    [self.sleepTimeLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(15);
    }];
    
    [self.sleepTimeGroup mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.sleepTimeLable.mas_right).offset(10);
        make.right.equalTo(self).offset(-10);
        make.height.mas_equalTo(@30);
        make.centerY.equalTo(self.sleepTimeLable);
    }];
    
    [self.submitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(150, 35));
        make.top.equalTo(self.sleepTimeGroup.mas_bottom).offset(7);
        make.centerX.equalTo(self.editView);
        make.bottom.equalTo(self.editView).offset(-12);
    }];
    
    [self.scoreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.editView);
        make.top.equalTo(self.sleepTimeGroup.mas_bottom).offset(7);
        make.bottom.equalTo(self.editView).offset(-12);
    }];
}

#pragma mark - settingAndGetting
- (UIView*) editView{
    if (!_editView) {
        _editView = [UIView new];
        _editView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:_editView];
    }
    return _editView;
}

- (UILabel*) titleLabel{
    if (!_titleLabel) {
        _titleLabel = [self.editView addLabel];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = [UIColor commonTextColor];
        _titleLabel.text = [self.situation title];
    }
    return _titleLabel;
}

- (UILabel*) sleepTimeLable{
    if (!_sleepTimeLable) {
        _sleepTimeLable = [self.editView addLabel];
        _sleepTimeLable.font = [UIFont systemFontOfSize:14];
        _sleepTimeLable.textColor = [UIColor commonTextColor];
        _sleepTimeLable.text = @"入睡时间";
    }
    return _sleepTimeLable;
}

- (RadioGroup*) sleepTimeGroup{
    if (!_sleepTimeGroup) {
        _sleepTimeGroup = [[RadioGroup alloc] initWithTitles:@[@"很晚（没睡）", @"比较晚", @"正常"] orientation:Radio_Horizontal];
        [self.editView addSubview:_sleepTimeGroup];
    }
    return _sleepTimeGroup;
}

- (UIButton*) submitButton{
    if (!_submitButton) {
        _submitButton = [self.editView addButton:UIButtonTypeCustom];
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
        _scoreLabel = [self.editView addLabel];
        _scoreLabel.font = [UIFont systemFontOfSize:15];
        _scoreLabel.textColor = [UIColor commonTextColor];
        
        _scoreLabel.text = [NSString stringWithFormat:@"得分: %ld", self.situation.score];
    }
    return _scoreLabel;
}

#pragma mark - button click event
- (void) submitButtonClicked:(id) sender{
    self.situation.status = self.sleepTimeGroup.selectedIndex;
    if (self.delegate && [self.delegate respondsToSelector:@selector(submitSleepSituation:)]) {
        [self.delegate submitSleepSituation:self.situation];
    }
}
@end
