//
//  UIButton+Demo.m
//  Demo
//
//  Created by 郑亚恒 on 15/8/25.
//  Copyright © 2015年 郑亚恒. All rights reserved.
//

#import "UIButton+Demo.h"

@implementation UIButton (Demo)

+ (instancetype)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth {
    
    UIButton *btn = [[UIButton alloc]init];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    btn.layer.borderColor = borderColor.CGColor;
    btn.layer.borderWidth = borderWidth;
    
    return btn;
}

@end
