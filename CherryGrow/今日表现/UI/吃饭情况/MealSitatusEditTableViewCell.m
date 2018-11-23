//
//  MealSitatusEditTableViewCell.m
//  CherryGrow
//
//  Created by YinQ on 2018/10/26.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "MealSitatusEditTableViewCell.h"
#import "MealSituationEditView.h"

@interface MealSitatusEditTableViewCell ()

@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) MealSituationEditView* editView;

@end

@interface MealSituation (TableCell)
- (NSString*) mealTitle;
@end

@implementation MealSituation (TableCell)

- (NSString*) mealTitle{
    NSString* mealTitle = @"早餐";
    
    switch (self.code) {
        case 0:
            mealTitle = @"早餐";
            break;
        case 1:
            mealTitle = @"午餐";
            break;
        case 2:
            mealTitle = @"晚餐";
            break;
        default:
            break;
    }
    return mealTitle;
}
@end

@implementation MealSitatusEditTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id) initWithTitle:(NSString*) title{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MealSitatusEditTableViewCell"];
    if (self) {
        _title = title;
        [self layoutElements];
        [self.contentView setBackgroundColor:[UIColor commonBackgroundColor]];
    }
    return self;
}

- (id) initWithMealSituation:(MealSituation*) situation{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MealSitatusEditTableViewCell"];
    if (self) {
        _title = [situation mealTitle];
        [self layoutElements];
        [self.contentView setBackgroundColor:[UIColor commonBackgroundColor]];
        
        [self.editView setMealSituation:situation];
        [self setMealCode:situation.code];
        
        [self.editView setDelegate:self.delegate];
    }
    return self;
}

- (void) layoutElements{
    [self.editView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(10, 12.5, 10, 12.5));
    }];
}

#pragma mark - settingAndGetting
- (MealSituationEditView*) editView{
    if (!_editView) {
        _editView = [[MealSituationEditView alloc] initWithTitle:self.title];
        [self.contentView addSubview:_editView];
    }
    return _editView;
}

- (void) setMealCode:(NSInteger)mealCode{
    _mealCode = mealCode;
    [self.editView setMealCode:mealCode];
}

- (void) setDelegate:(id<MealSituationEditDelegate>)delegate{
    _delegate = delegate;
    [self.editView setDelegate:delegate];
}

@end
