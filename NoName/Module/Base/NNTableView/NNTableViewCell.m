//
//  NNTableViewCell.m
//  NoName
//
//  Created by Danish on 2018/10/26.
//  Copyright © 2018 Danish. All rights reserved.
//

#import "NNTableViewCell.h"



@implementation NNTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


#pragma mark - Property

- (id)itemModel
{
    return self._itemModel;
}

- (UIView *)_dey_separatorView
{
    if (!__dey_separatorView) {
        __dey_separatorView = [self dey_findSeparatorViewUnder:self];
    }
    
    return __dey_separatorView;
}


#pragma mark - Interface

+ (CGFloat)dey_heightForCellWithItem:(id)item
{
    return 60;
}

- (void)dey_configWithItemModel:(id)itemModel
{
    self.itemModel = itemModel;
}


#pragma mark Private Methods

- (UIView *)dey_findSeparatorViewUnder:(UIView *)view
{
    UIView *separatorView = nil;
    for (UIView *v in view.subviews) {
        if (v.bounds.size.height * [UIScreen mainScreen].scale == 1) {
            separatorView = v;
            break;
        }
        
        [self dey_findSeparatorViewUnder:v];
    }
    
    return separatorView;
}



@end
