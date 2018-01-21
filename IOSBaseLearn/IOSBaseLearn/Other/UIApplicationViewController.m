//
//  UIApplicationViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/7/24.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "UIApplicationViewController.h"

@interface UIApplicationViewController ()

- (IBAction)badgeClick:(id)sender;
- (IBAction)showActivityClick:(id)sender;
- (IBAction)telClick:(id)sender;
- (IBAction)urlClick:(id)sender;


@end

@implementation UIApplicationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    从iOS7开始，系统提供了2种管理状态栏的方式
//    通过UIViewController管理（每一个UIViewController都可以拥有自己不同的状态栏）
//    通过UIApplication管理（一个应用程序的状态栏都由它统一管理）
//    在iOS7中，默认情况下，状态栏都是由UIViewController管理的，UIViewController实现下列方法就可以轻松管理状态栏的可见性和样式
//    状态栏的样式- (UIStatusBarStyle)preferredStatusBarStyle;
//    状态栏的可见性(BOOL)prefersStatusBarHidden;
//    想利用UIApplication来管理状态栏，首先得修改Info.plist的设置
    
    
//    打电话UIApplication *app = [UIApplication sharedApplication];[app openURL:[NSURL URLWithString:@"tel://10086"]];
//    发短信[app openURL:[NSURL URLWithString:@"sms://10086"]];
//    发邮件[app openURL:[NSURL URLWithString:@"mailto://12345@qq.com"]];
//    打开一个网页资源[app openURL:[NSURL URLWithString:@"http://m.baidu.cn"]];
    
}


- (IBAction)badgeClick:(id)sender {
    
    UIApplication * app = [UIApplication sharedApplication];
    app.applicationIconBadgeNumber = 123;
//    iOS8以后需要注册,才能将未读的数在图标右上角显示 参照 AppDelegate.m 的didFinishLaunchingWithOptions
    
}

- (IBAction)showActivityClick:(id)sender {
    UIApplication * app = [UIApplication sharedApplication];
    if (app.networkActivityIndicatorVisible) {
        app.networkActivityIndicatorVisible = NO;
    } else {
        app.networkActivityIndicatorVisible = YES;
    }
    
    
}

- (IBAction)telClick:(id)sender {
    UIApplication * app = [UIApplication sharedApplication];
    [app openURL:[NSURL URLWithString:@"tel://10086"] options:@{} completionHandler:^(BOOL success) {
        NSLog(@"打电话ok");
    }];
}

- (IBAction)urlClick:(id)sender {
    UIApplication * app = [UIApplication sharedApplication];
    [app openURL:[NSURL URLWithString:@"https://m.baidu.com"] options:@{} completionHandler:^(BOOL success) {
        NSLog(@"打网页ok");
    }];
}

@end
