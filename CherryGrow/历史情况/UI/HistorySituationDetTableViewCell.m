//
//  HistorySituationDetTableViewCell.m
//  CherryGrow
//
//  Created by YinQ on 2018/11/27.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "HistorySituationDetTableViewCell.h"
#import "MealHistoryDetModel.h"
#import "SleepHistoryDetModel.h"
#import "InterestHistoryDetModel.h"

@interface SituationHistoryDetModel (CellDesc)

- (NSString*) title;

- (NSString*) desc;
@end

@implementation SituationHistoryDetModel (CellDesc)

- (NSString*) title{
    NSString* title = @"";
    if ([self isKindOfClass:[MealHistoryDetModel class]]) {
        MealHistoryDetModel* detModel = (MealHistoryDetModel*) self;
        title = detModel.codeName;
    }
    if ([self isKindOfClass:[SleepHistoryDetModel class]]) {
        SleepHistoryDetModel* detModel = (SleepHistoryDetModel*) self;
        title = detModel.codeName;
    }
    if ([self isKindOfClass:[InterestHistoryDetModel class]]) {
        InterestHistoryDetModel* detModel = (InterestHistoryDetModel*) self;
        title = detModel.cateName;
    }
    return title;
}

- (NSString*) desc{
    NSString* desc = @"";
    if ([self isKindOfClass:[MealHistoryDetModel class]]) {
        MealHistoryDetModel* detModel = (MealHistoryDetModel*) self;
        desc = [NSString stringWithFormat:@"速度:%@ %@ 吃得%@", detModel.speedName, detModel.feedName, detModel.amountName];
    }
    if ([self isKindOfClass:[SleepHistoryDetModel class]]) {
        SleepHistoryDetModel* detModel = (SleepHistoryDetModel*) self;
        desc = detModel.statusName;
    }
    if ([self isKindOfClass:[InterestHistoryDetModel class]]) {
        InterestHistoryDetModel* detModel = (InterestHistoryDetModel*) self;
        desc = detModel.statusName;
    }
    return desc;
}
@end

@interface HistorySituationDetTableViewCell ()

@property (nonatomic, strong) UIView* situationView;
@property (nonatomic, strong) UIView* detView;
@property (nonatomic, strong) UILabel* updateLabel;

@property (nonatomic, strong) UILabel* titleLable;
@property (nonatomic, strong) UILabel* descLabel;

@end

@implementation HistorySituationDetTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
    // Configure the view for the selected state
}

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setBackgroundColor:[UIColor commonBackgroundColor]];
        [self layoutElements];
    }
    return self;
}

- (void) layoutElements{
    [self.situationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(10, 12.5, 10, 12.5));
    }];
    
    [self layoutDetView];
    
    [self.updateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.detView.mas_bottom).offset(6);
        make.right.equalTo(self.situationView).offset(-12);
        make.bottom.equalTo(self.situationView).offset(-7.5);
    }];
}

- (void) layoutDetView{
    [self.detView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.situationView).offset(12);
        make.top.equalTo(self.situationView).offset(10);
        make.right.equalTo(self.situationView).offset(-12);
    }];
    
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.detView);
        make.top.equalTo(self.detView).offset(3);
    }];
    
    [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.detView);
        make.top.equalTo(self.titleLable.mas_bottom).offset(6);
        make.bottom.equalTo(self.detView).offset(-5);
    }];
}

#pragma mark - settingAndGetting
- (UIView*) situationView{
    if (!_situationView) {
        _situationView = [[UIView alloc] init];
        [self.contentView addSubview:_situationView];
        [_situationView setBackgroundColor:[UIColor whiteColor]];
        [_situationView setCornerRadius:4.5];
    }
    return _situationView;
}

- (UIView*) detView{
    if (!_detView) {
        _detView = [[UIView alloc] init];
        [self.situationView addSubview:_detView];
    }
    return _detView;
}

- (UILabel*) updateLabel{
    if (!_updateLabel) {
        _updateLabel = [self.situationView addLabel];
        _updateLabel.textColor = [UIColor commonGrayTextColor];
        _updateLabel.font = [UIFont systemFontOfSize:12];
    }
    return _updateLabel;
}

- (UILabel*) titleLable{
    if (!_titleLable) {
        _titleLable = [self.detView addLabel];
        _titleLable.textColor = [UIColor commonTextColor];
        _titleLable.font = [UIFont systemFontOfSize:15];
    }
    return _titleLable;
}

- (UILabel*) descLabel{
    if (!_descLabel) {
        _descLabel = [self.detView addLabel];
        _descLabel.textColor = [UIColor commonTextColor];
        _descLabel.font = [UIFont systemFontOfSize:15];
        _descLabel.numberOfLines = 0;
    }
    return _descLabel;
}

- (void) setSituationHistoryDet:(SituationHistoryDetModel*) detModel{
    self.titleLable.text = [detModel title];
    self.descLabel.text = [detModel desc];
    self.updateLabel.text = [NSString stringWithFormat:@"%@ %@", detModel.userName, detModel.updateTime];
}
@end
