//
//  TagView.m
//  YYCommon
//
//  Created by YinQ on 2018/8/8.
//

#import "TagView.h"



@interface TagCell : UIControl

@property (nonatomic, strong) UILabel* titleLabel;


@end

@implementation TagCell

- (id) initWithTitle:(NSString*) title{
    self = [super init];
    if (self) {
        self.titleLabel.text = title;
        [self layoutElements];
        [self showBoarder:UIViewBorderLineTypeBottom];
        
    }
    return self;
}

- (void) layoutElements{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.width.lessThanOrEqualTo(self).offset(-5);
    }];
}

#pragma mark - settingAndGetting
- (UILabel*) titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        [self addSubview:_titleLabel];
        
        [_titleLabel setTextColor:[UIColor commonGrayTextColor]];
        [_titleLabel setFont:[UIFont systemFontOfSize:14]];
    }
    return _titleLabel;
}

- (void) setSelected:(BOOL)selected{
    [super setSelected:selected];
    
    if (selected) {
        [self.titleLabel setTextColor:[UIColor commonTextColor]];
    }
    else{
        [self.titleLabel setTextColor:[UIColor commonGrayTextColor]];
    }
}
@end

@interface TagView ()

@property (nonatomic, readonly) NSArray<TagCell*>* cells;
@property (nonatomic, strong) UIView* selectedView;

@end

@implementation TagView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setBackgroundColor:[UIColor commonBackgroundColor]];
        [self showBoarder:UIViewBorderLineTypeBottom];
        _selectTagColor = [UIColor mainThemeColor];
    }
    return self;
}

- (void) createTagCells:(NSArray<NSString*>*) titles{
    [self removeAllSubviews];
    _selectIndex = 0;
    NSMutableArray<TagCell*>* cells = [NSMutableArray<TagCell*> array];
    
    [titles enumerateObjectsUsingBlock:^(NSString * _Nonnull title, NSUInteger idx, BOOL * _Nonnull stop) {
        TagCell* cell = [[TagCell alloc] initWithTitle:title];
        [cells addObject:cell];
        [self addSubview:cell];
        [cell setSelected:(idx == self.selectIndex)];
        [cell addTarget:self action:@selector(tagCellClicked:) forControlEvents:UIControlEventTouchUpInside];
    }];
    
    _cells = cells;
    [self layoutCells];
    
    _selectedView = [[UIView alloc] init];
    [self addSubview:_selectedView];
    [_selectedView setBackgroundColor:self.selectTagColor];
    
    TagCell* selectedCell = self.cells[self.selectIndex];
    [self.selectedView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self);
        make.height.mas_equalTo(3);
        make.left.right.equalTo(selectedCell);
    }];
}

- (void) layoutCells{
    __block MASViewAttribute* cellLeft = self.mas_left;
    __block MASViewAttribute* cellWidth;
    
    [self.cells enumerateObjectsUsingBlock:^(TagCell * _Nonnull cell, NSUInteger idx, BOOL * _Nonnull stop) {
        [cell mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(self);
            make.left.equalTo(cellLeft);
            if (cellWidth) {
                make.width.equalTo(cellWidth);
            }
            if (cell == self.cells.lastObject) {
                make.right.equalTo(self);
            }
        }];
        
        cellLeft = cell.mas_right;
        cellWidth = cell.mas_width;
    }];
}

- (void) updateSelectedView{
    TagCell* selectedCell = self.cells[self.selectIndex];
    [UIView animateWithDuration:0.2 animations:^{
        [self.selectedView setLeft:selectedCell.left];
    }];
    
    [self.cells enumerateObjectsUsingBlock:^(TagCell * _Nonnull cell, NSUInteger idx, BOOL * _Nonnull stop) {
        [cell setSelected:(idx == self.selectIndex)];
    }];
}

#pragma mark - settingAndGetting
- (void) setSelectIndex:(NSInteger)selectIndex
{
    if (selectIndex == _selectIndex) {
        return;
    }
    
    _selectIndex = selectIndex;
    [self updateSelectedView];
}

- (void) setSelectTagColor:(UIColor *)selectTagColor{
    _selectTagColor = selectTagColor;
    if (self.selectedView) {
        [self.selectedView setBackgroundColor:_selectTagColor];
    }
}

#pragma mark - cell click event
- (void) tagCellClicked:(id) sender{
    if (![sender isKindOfClass:[TagCell class]]) {
        return;
    }
    
    NSInteger index = [self.cells indexOfObject:sender];
    if (index == NSNotFound) {
        return;
    }
    if (index == self.selectIndex) {
        return;
    }
    
    [self setSelectIndex:index];
    [self.cells enumerateObjectsUsingBlock:^(TagCell * _Nonnull cell, NSUInteger idx, BOOL * _Nonnull stop) {
        [cell setSelected:(idx == self.selectIndex)];
    }];
}

@end
