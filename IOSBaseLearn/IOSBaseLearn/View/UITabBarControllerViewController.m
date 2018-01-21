//
//  UITabBarControllerViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/7/12.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "UITabBarControllerViewController.h"
#import "TabBar0ViewController.h"
#import "TabBar1ViewController.h"
#import "TabBar2ViewController.h"
#import "UILabelViewController.h"
#import "NavigationViewController.h"
#import "UIButtonViewController.h"

@interface UITabBarControllerViewController ()

@end

@implementation UITabBarControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.translucent = YES; //默认半透明
//    self.tabBar.barTintColor = [UIColor redColor]; //背景颜色
//    self.tabBar.tintColor = [UIColor greenColor]; //item的颜色
    
    TabBar0ViewController * tab0VC = [[TabBar0ViewController alloc]init];
    tab0VC.tabBarItem.title = @"tab0";
    
    TabBar1ViewController * tab1VC = [[TabBar1ViewController alloc]init];
    tab1VC.title = @"tab1";
    
    TabBar2ViewController * tab2VC = [[TabBar2ViewController alloc]init];
    tab2VC.title = @"tab2";
    
    UILabelViewController * tab3VC = [[UILabelViewController alloc]init];
    tab3VC.title = @"tab3";
    NavigationViewController * tab4VC = [[NavigationViewController alloc]init];
    tab4VC.title = @"tab4";
    tab4VC.tabBarItem.badgeValue = @"3";
    UIButtonViewController * tab5VC = [[UIButtonViewController alloc]init];
    tab5VC.title = @"tab5";
    
    NSArray * arr = [NSArray arrayWithObjects:tab0VC, tab1VC, tab2VC, tab3VC, tab4VC, tab5VC, nil];
    self.viewControllers = arr;
    
    self.selectedIndex = 2;
    
    if (self.selectedViewController == tab2VC) {
        NSLog(@"tab2VC");
    }
    // TODO X TabBar与UINavigationController联合使用方法
    
    self.delegate = self;
    
}

#pragma mark: - delegate 
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    NSLog(@"被选中 %lu", (unsigned long)self.selectedIndex);
}

@end
