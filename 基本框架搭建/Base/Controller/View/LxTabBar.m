//
//  LxTabBar.m
//  基本框架搭建
//
//  Created by Lx on 15/11/16.
//  Copyright © 2015年 Lx. All rights reserved.
//

#import "LxTabBar.h"
#import "LxButton.h"

@interface LxTabBar()

@property (nonatomic, strong)UIButton *buttonItem;
@property (nonatomic, strong)UIImageView *topLine;

@end

@implementation LxTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //设置阴影
        [self config];
        //设置中间按钮
        LxButton *button = [LxButton lxbutton];
        [self addSubview:button];
        self.buttonItem = button;
    }
    return self;
}

- (void)config {
    self.backgroundColor = [UIColor whiteColor];
    UIImageView *topLine = [[UIImageView alloc] init];
    topLine.image = [UIImage imageNamed:@"tapbar_top_line"];
    [self addSubview:topLine];
    self.topLine = topLine;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat barWidth = self.frame.size.width;
    CGFloat barHeight = self.frame.size.height;
    
    //添加按钮的位置
    self.buttonItem.center = CGPointMake(barWidth * 0.5, barHeight * 0.075);
    
    //背景线位置
    self.topLine.frame = CGRectMake(0, -5, self.bounds.size.width, 5);
    
    //设置其他TabBar的位置和尺寸
    CGFloat tabbarButtonW = barWidth / 5;
    CGFloat tabbarButtonInedx = 0;
    for (UIView *child in self.subviews) {
        Class class = NSClassFromString(@"UITabBarButton");
        if ([child isKindOfClass:class]) {
            
            CGFloat buttonX = tabbarButtonInedx * tabbarButtonW;
            
            if (tabbarButtonInedx >= 2) {
                buttonX += tabbarButtonW;
            }
            
            child.frame = CGRectMake(buttonX, 1, tabbarButtonW, barHeight);
            
            tabbarButtonInedx ++;
        }
    }
}

@end