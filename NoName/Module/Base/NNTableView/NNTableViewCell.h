//
//  NNTableViewCell.h
//  NoName
//
//  Created by Danish on 2018/10/26.
//  Copyright © 2018 Danish. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NNTableViewCell : UITableViewCell

/**
 *  item模型
 */
@property (nonatomic, strong) id itemModel;

/**
 *  分割线缩进
 */
@property (nonatomic) UIEdgeInsets dey_separatorInset;

@property (nonatomic, weak) UIView *_dey_separatorView;
@property (nonatomic, strong) id _itemModel;


/**
 *  根据指定的Item & 宽度返回Cell高度
 *
 *  @param item        显示Item
 *
 *  @return 高度
 */
+ (CGFloat)dey_heightForCellWithItem:(id)item;


/**
 *  指定ItemModel布局显示内容 重载后必须调用Super
 *
 *  @param itemModel 显示ItemModel
 */
- (void)dey_configWithItemModel:(id)itemModel;

@end

NS_ASSUME_NONNULL_END
