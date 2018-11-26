//
//  TodayInterestSituationTableViewCell.m
//  CherryGrow
//
//  Created by YinQ on 2018/11/26.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "TodayInterestSituationTableViewCell.h"



@interface TodayInterestSituationTableViewCell ()

@property (nonatomic, strong) UIView* situationView;
@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UILabel* statusLabel;

@end

@implementation TodayInterestSituationTableViewCell

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
        [self.contentView setBackgroundColor:[UIColor commonBackgroundColor]];
        [self layoutElements];
    }
    return self;
}

- (void) layoutElements{
    [self.situationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(7, 12, 7, 12));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.situationView);
        make.left.equalTo(self.situationView).offset(12.5);
        make.height.equalTo(self.situationView).offset(-33);
    }];
    
    [self.statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.situationView);
        make.right.equalTo(self.situationView).offset(-12.5);
    }];
}

#pragma mark - settingAndGetting
- (UIView*) situationView{
    if (!_situationView) {
        _situationView = [[UIView alloc] init];
        [_situationView setBackgroundColor:[UIColor whiteColor]];
        [_situationView setCornerRadius:4];
        [self.contentView addSubview:_situationView];
    }
    return _situationView;
}

- (UILabel*) titleLabel{
    if (!_titleLabel) {
        _titleLabel = [self.situationView addLabel];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = [UIColor commonTextColor];
    }
    return _titleLabel;
}

- (UILabel*) statusLabel{
    if (!_statusLabel) {
        _statusLabel = [self.situationView addLabel];
        _statusLabel.font = [UIFont systemFontOfSize:14];
        _statusLabel.textColor = [UIColor commonTextColor];
    }
    return _statusLabel;
}

- (void) setSituation:(InterestSituation *)situation{
    _situation = situation;
    self.titleLabel.text = situation.cateName;
    self.statusLabel.text = situation.statusName;
}
@end
