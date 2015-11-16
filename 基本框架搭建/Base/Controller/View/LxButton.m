//
//  LxButton.m
//  基本框架搭建
//
//  Created by Lx on 15/11/16.
//  Copyright © 2015年 Lx. All rights reserved.
//

#import "LxButton.h"

@implementation LxButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.adjustsImageWhenHighlighted = NO;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return self;
}

+ (instancetype)lxbutton
{
    LxButton *button = [[LxButton alloc] init];
    
    [button setImage:[UIImage imageNamed:@"post_normal"] forState:UIControlStateNormal];
    [button setTitle:@"Five" forState:UIControlStateNormal];
    
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:9.5];
    
    [button sizeToFit];
    
    [button addTarget:button action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // Center image
    CGPoint center = self.imageView.center;
    center.x = self.frame.size.width/2;
    center.y = self.imageView.frame.size.height/2;
    self.imageView.center = center;
    
    //Center text
    CGRect newFrame = [self titleLabel].frame;
    newFrame.origin.x = 0;
    newFrame.origin.y = self.imageView.frame.size.height + 5;
    newFrame.size.width = self.frame.size.width;
    self.titleLabel.frame = newFrame;
}

#pragma mark - 点击事件

- (void)click:(UIButton *)btn
{
    
}

@end 