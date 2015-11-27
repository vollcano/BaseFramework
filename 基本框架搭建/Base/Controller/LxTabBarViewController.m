//
//  LxTabBarViewController.m
//  基本框架搭建
//
//  Created by Lx on 15/11/16.
//  Copyright © 2015年 Lx. All rights reserved.
//

#import "LxTabBarViewController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"
#import "LxTabBar.h"

@interface LxTabBarViewController ()

@end

@implementation LxTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpChildViewController];
    
    //KVC更改tabbar
    [self setValue:[[LxTabBar alloc] init] forKey:@"tabBar"];
    
    [[UITabBar appearance] setBackgroundImage:[self imageWithColor:[UIColor whiteColor]]];
    
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
}

/**
 *  @author Lx
 *
 *  设置子控制器
 */
- (void)setUpChildViewController
{
    //One
    OneViewController *One = [[UIStoryboard storyboardWithName:@"One" bundle:nil] instantiateInitialViewController];
    
    //Two
    TwoViewController *Two = [[UIStoryboard storyboardWithName:@"Two" bundle:nil] instantiateInitialViewController];
    
    //Three
    ThreeViewController *Three = [[UIStoryboard storyboardWithName:@"Three" bundle:nil] instantiateInitialViewController];
    
    //Four
    FourViewController *Four = [[UIStoryboard storyboardWithName:@"Four" bundle:nil] instantiateInitialViewController];
    
    [self addChildViewController:One
                           title:@"One"
                           image:@"account_normal"
                   selectedImage:@"account_highlight"];
    
    [self addChildViewController:Two
                           title:@"Two"
                           image:@"home_normal"
                   selectedImage:@"home_highlight"];
    
    [self addChildViewController:Three
                           title:@"Three"
                           image:@"message_normal"
                   selectedImage:@"message_highlight"];
    
    [self addChildViewController:Four
                           title:@"Four"
                           image:@"mycity_normal"
                   selectedImage:@"mycity_highlight"];
}

/**
 *  @author Lx
 *
 *  设置子控制器
 *
 *  @param viewController 控制器
 *  @param title          title
 *  @param image          普通状态按钮
 *  @param selectedImage  点击状态按钮
 */
- (void)addChildViewController:(UIViewController *)viewController title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    //同时设置nav和tabbar的title
    viewController.title = title;
    
    viewController.tabBarItem.image = [UIImage imageNamed:image];
    
    //使用图片的原始渲染效果
    viewController.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    
    //设置文字样式
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    [viewController.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    NSMutableDictionary *selectAttrs = [NSMutableDictionary dictionary];
    selectAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    [viewController.tabBarItem setTitleTextAttributes:selectAttrs forState:UIControlStateSelected];
    
    //包装Nav
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    //添加字控制器
    [self addChildViewController:nav];
}

//将颜色转换成图片
- (UIImage *)imageWithColor:(UIColor *)color
{
    NSParameterAssert(color != nil);
    
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
