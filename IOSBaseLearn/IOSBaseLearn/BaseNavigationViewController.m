//
//  BaseNavigationViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/8/3.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "BaseNavigationViewController.h"
#import "ViewController.h"
#import "OtherViewController.h"

@interface BaseNavigationViewController ()

@end

@implementation BaseNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

// 当该类第一次用到的时候就调用
+ (void)initialize
{
    // 可设置navigationcotroller的主题
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [super pushViewController:viewController animated:animated];
//    viewController.hidesBottomBarWhenPushed = YES; //tabbarviewcontroller 跳转的时候，可隐藏tabbar, 之所以写在这里，是因为写在baseviewcontroller的话，viewcontroller可能是UIViewController也可能是TableViewController
}

@end
