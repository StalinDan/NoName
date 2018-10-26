//
//  BaseViewController.h
//  NoName
//
//  Created by Danish on 2018/10/24.
//  Copyright © 2018 Danish. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController


/**
 隐藏导航栏

 @return 默认返回NO
 */
- (BOOL)isHideNavgationBar;

/**
 *  增加返回按钮
 */
- (void)addBackButton;

/**
 *  返回
 */
- (void)goToBack;

@end

NS_ASSUME_NONNULL_END
