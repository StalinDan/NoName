//
//  NNUI.m
//  NoName
//
//  Created by Danish on 2018/10/29.
//  Copyright © 2018 Danish. All rights reserved.
//

#import "NNUI.h"
#import <YYImage.h>

@implementation NNUI

#pragma mark - UIView

+ (UIView *)viewWithBgColor:(UIColor *)bgColor {
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = bgColor;
    return view;
}

+ (UIView *)viewWithBgColor:(UIColor *)bgColor frame:(CGRect)frame
{
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = bgColor;
    
    return view;
}

#pragma mark - UILabel

+ (UILabel *)labelWithFont:(UIFont *)font color:(UIColor *)color text:(NSString *)text
{
    UILabel *label = [[UILabel alloc] init];
    label.font = font;
    label.textColor = color;
    label.text = text;
    
    return label;
}


#pragma mark - UIButton

+ (UIButton *)buttonWithTitle:(NSString *)title
                        color:(UIColor *)color
                       target:(id)target
                       action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

+ (UIButton *)buttonWithTitle:(NSString *)title
                        color:(UIColor *)color
                      bgColor:(UIColor *)bgColor
                         font:(UIFont *)font
                       target:(id)target
                       action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    button.titleLabel.font = font;
    button.backgroundColor = bgColor;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}


#pragma mark - UITextField

+ (UITextField *)textFieldWithTextColor:(UIColor *)color
{
    UITextField *textField = [[UITextField alloc] init];
    textField.textColor = color;
    
    return textField;
}


#pragma mark - UIImageView

+ (UIImageView *)imageViewWithImageName:(NSString *)imageName
{
    UIImageView *imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    //    imageV.backgroundColor = [UIColor brownColor];
    
    return imageV;
}

+ (UIImageView *)imageViewWithImageUrlStr:(NSString *)imageUrlStr
{
    UIImageView *imageV = [[UIImageView alloc] init];
    //    imageV.backgroundColor = [UIColor orangeColor];
    imageV.yy_imageURL = [NSURL URLWithString:imageUrlStr];
    
    return imageV;
}

@end
