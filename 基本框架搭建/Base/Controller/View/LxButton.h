//
//  LxButton.h
//  基本框架搭建
//
//  Created by Lx on 15/11/16.
//  Copyright © 2015年 Lx. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LxButton;

@protocol LxButtonDelegate <NSObject>

- (void)lxButtonClick:(LxButton *)btn;

@end

@interface LxButton : UIButton

@property (nonatomic, weak)id<LxButtonDelegate> delegate;

+ (instancetype)lxbutton;

@end
