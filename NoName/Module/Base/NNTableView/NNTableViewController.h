//
//  NNTableViewController.h
//  NoName
//
//  Created by Danish on 2018/10/26.
//  Copyright © 2018 Danish. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface NNTableViewController : BaseViewController

/**
 *  TableView对象
 */
@property (nonatomic, strong) UITableView *nn_tableView;

/**
 *  TableView偏移
 */
@property (nonatomic, readonly) UIEdgeInsets nn_tableViewOffsetInset;

/**
 *  TableView风格 默认UITableViewStylePlain
 */
@property (nonatomic, assign) UITableViewStyle nn_tableViewStyle;

/**
 *  配置TableView
 *
 *  @param tableView tableView对象
 */
- (void)nn_configForTableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
