//
//  NNUI.h
//  NoName
//
//  Created by Danish on 2018/10/29.
//  Copyright © 2018 Danish. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NNUI : NSObject


+ (UIView *)viewWithBgColor:(UIColor *)bgColor;

+ (UIView *)viewWithBgColor:(UIColor *)bgColor frame:(CGRect)frame;

+ (UILabel *)labelWithFont:(UIFont *)font
                     color:(UIColor *)color
                      text:(NSString *)text;

+ (UIButton *)buttonWithTitle:(NSString *)title
                        color:(UIColor *)color
                       target:(id)target
                       action:(SEL)action;

+ (UIButton *)buttonWithTitle:(NSString *)title
                        color:(UIColor *)color
                      bgColor:(UIColor *)bgColor
                         font:(UIFont *)font
                       target:(id)target
                       action:(SEL)action;

+ (UITextField *)textFieldWithTextColor:(UIColor *)color;

+ (UIImageView *)imageViewWithImageName:(NSString *)imageName;

+ (UIImageView *)imageViewWithImageUrlStr:(NSString *)imageUrlStr;

@end

NS_ASSUME_NONNULL_END
