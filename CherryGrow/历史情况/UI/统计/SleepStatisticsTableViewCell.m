//
//  SleepStatisticsTableViewCell.m
//  CherryGrow
//
//  Created by YinQ on 2018/12/18.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "SleepStatisticsTableViewCell.h"
#import "SleepStatisticsDetModel.h"

@interface SleepStatisticsTableViewCell ()

@property (nonatomic, strong) UIView* monthView;
@property (nonatomic, strong) UILabel* monthLabel;
@property (nonatomic, strong) UILabel* staticsLabel;

@property (nonatomic, strong) UILabel* noonLabel;
@property (nonatomic, strong) UILabel* eveningLabel;
@end

@implementation SleepStatisticsTableViewCell

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
        [self layoutElments];
    }
    return self;
}

- (void) layoutElments{
    [self.monthView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.contentView);
        make.height.mas_equalTo(@39);
    }];
    
    [self.monthLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.monthView);
        make.left.equalTo(self.monthView).offset(13);
    }];
    
    [self.staticsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.monthView);
        make.right.equalTo(self.monthView).offset(-13);
    }];
    
    [self.noonLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.monthView.mas_bottom).offset(11);
        make.left.equalTo(self.contentView).offset(13);
        //make.bottom.equalTo(self.contentView).offset(-11);
    }];
    
    [self.eveningLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.noonLabel.mas_bottom).offset(11);
        make.left.equalTo(self.contentView).offset(13);
        make.bottom.equalTo(self.contentView).offset(-11);
    }];
}

#pragma mark - settingAndGetting
- (UIView*) monthView{
    if (!_monthView) {
        _monthView = [[UIView alloc] init];
        [self.contentView addSubview:_monthView];
        _monthView.backgroundColor = [UIColor commonBackgroundColor];
        [_monthView showBoarder:UIViewBorderLineTypeBottom];
    }
    return _monthView;
}

- (UILabel*) monthLabel{
    if (!_monthLabel) {
        _monthLabel = [self.monthView addLabel];
        _monthLabel.font = [UIFont systemFontOfSize:13];
        _monthLabel.textColor = [UIColor mainThemeColor];
    }
    return _monthLabel;
}

- (UILabel*) staticsLabel{
    if (!_staticsLabel) {
        _staticsLabel = [self.monthView addLabel];
        _staticsLabel.font = [UIFont systemFontOfSize:13];
        _staticsLabel.textColor = [UIColor commonTextColor];
    }
    return _staticsLabel;
}

- (UILabel*) noonLabel{
    if (!_noonLabel) {
        _noonLabel = [self.contentView addLabel];
        _noonLabel.font = [UIFont systemFontOfSize:14];
        _noonLabel.textColor = [UIColor commonTextColor];
    }
    return _noonLabel;
}

- (UILabel*) eveningLabel{
    if (!_eveningLabel) {
        _eveningLabel = [self.contentView addLabel];
        _eveningLabel.font = [UIFont systemFontOfSize:14];
        _eveningLabel.textColor = [UIColor commonTextColor];
    }
    return _eveningLabel;
}

- (void) setSleepStatisticsDetModel:(SleepStatisticsDetModel*) detModel{
    self.monthLabel.text = detModel.month;
    
    NSString* countString = [NSString stringWithFormat:@" %ld", detModel.count];
    NSString* scoreString = [NSString stringWithFormat:@" %.2f", detModel.score];
    NSString* statisticsString = [NSString stringWithFormat:@"记录: %@   得分: %@", countString, scoreString];
    NSRange countRange = [statisticsString rangeOfString:countString];
    NSRange scoreRange = [statisticsString rangeOfString:scoreString];
    NSMutableAttributedString* attrString = [[NSMutableAttributedString alloc] initWithString:statisticsString];
    [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor mainThemeColor] range:countRange];
    [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor mainThemeColor] range:scoreRange];
    [self.staticsLabel setAttributedText:attrString];
    
    NSString* noonEarlyStr = [NSString stringWithFormat:@"%ld", detModel.noonEarlyCount];
    NSString* noonNormalStr = [NSString stringWithFormat:@"%ld", detModel.noonNormalCount];
    NSString* noonLateStr = [NSString stringWithFormat:@"%ld", detModel.noonLateCount];
    NSString* noonString = [NSString stringWithFormat:@"午睡：  睡得早 "];
    
    NSRange noonEarlyRange = NSMakeRange(noonString.length, noonEarlyStr.length);
    noonString = [noonString stringByAppendingString:noonEarlyStr];
    
    noonString = [noonString stringByAppendingString:@" 较晚 "];
    NSRange noonNormalRange = NSMakeRange(noonString.length, noonNormalStr.length);
    noonString = [noonString stringByAppendingString:noonNormalStr];
    
    noonString = [noonString stringByAppendingString:@" 很晚 "];
    NSRange noonLateRange = NSMakeRange(noonString.length, noonLateStr.length);
    noonString = [noonString stringByAppendingString:noonLateStr];
    
    NSMutableAttributedString* noonAttrString = [[NSMutableAttributedString alloc] initWithString:noonString];
    [noonAttrString addAttribute:NSForegroundColorAttributeName value:[UIColor mainThemeColor] range:noonEarlyRange];
    [noonAttrString addAttribute:NSForegroundColorAttributeName value:[UIColor mainThemeColor] range:noonNormalRange];
    [noonAttrString addAttribute:NSForegroundColorAttributeName value:[UIColor mainThemeColor] range:noonLateRange];
    self.noonLabel.attributedText = noonAttrString;
    
    NSString* eveningEarlyStr = [NSString stringWithFormat:@"%ld", detModel.eveningEarlyCount];
    NSString* eveningNormalStr = [NSString stringWithFormat:@"%ld", detModel.eveningNormalCount];
    NSString* eveningLateStr = [NSString stringWithFormat:@"%ld", detModel.eveningLateCount];
    NSString* eveningString = [NSString stringWithFormat:@"晚上：  睡得早 "];
    
    NSRange eveningEarlyRange = NSMakeRange(eveningString.length, eveningEarlyStr.length);
    eveningString = [eveningString stringByAppendingString:eveningEarlyStr];
    
    eveningString = [eveningString stringByAppendingString:@" 较晚 "];
    NSRange eveningNormalRange = NSMakeRange(eveningString.length, eveningNormalStr.length);
    eveningString = [eveningString stringByAppendingString:eveningNormalStr];
    
    eveningString = [eveningString stringByAppendingString:@" 很晚 "];
    NSRange eveningLateRange = NSMakeRange(eveningString.length, eveningLateStr.length);
    eveningString = [eveningString stringByAppendingString:eveningLateStr];
    
    NSMutableAttributedString* eveningAttrString = [[NSMutableAttributedString alloc] initWithString:eveningString];
    [eveningAttrString addAttribute:NSForegroundColorAttributeName value:[UIColor mainThemeColor] range:eveningEarlyRange];
    [eveningAttrString addAttribute:NSForegroundColorAttributeName value:[UIColor mainThemeColor] range:eveningNormalRange];
    [eveningAttrString addAttribute:NSForegroundColorAttributeName value:[UIColor mainThemeColor] range:eveningLateRange];
    self.eveningLabel.attributedText = eveningAttrString;
}
@end
