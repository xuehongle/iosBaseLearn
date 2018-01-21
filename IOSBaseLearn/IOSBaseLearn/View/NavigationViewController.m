//
//  NavigationViewController.m
//  IOSBaseLearn
//
//  Created by 薛乐 on 2017/7/11.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "NavigationViewController.h"
#import "UINavigationBarViewController.h"

@interface NavigationViewController ()
- (IBAction)navigationbarClick:(id)sender;

@end

@implementation NavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent = NO; //默认是yes 影响坐标的
//    // 导航条主题
//    // 1.1 navigationBar的背景颜色
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
//
//    // 1.2 设置所有导航条的标题颜色
//    NSMutableDictionary *md = [NSMutableDictionary dictionary];
//    md[NSFontAttributeName] = [UIFont systemFontOfSize:16];
//    md[NSForegroundColorAttributeName] = [UIColor whiteColor];
//    [self.navigationController.navigationBar setTitleTextAttributes:md];
    
/***************************基础begin***************************/
    // 这两个一样，哪个后设置是显示哪个
    self.title = @"标题";
    self.navigationItem.title = @"title";
    
//    一个导航控制器管理多个视图控制器（多个视图控制器共享一个导航控制器），而一个导航控制器只有一个UINavigationBar，被管理的多个视图控制器共享这一个UINavigationBar，只要一个视图控制器改变了UINavigationBar的属性则影响是全局的。每个视图控制器都会有属于自己的UINavigationItem，系统会以懒加载的方式创建一个UINavigationItem显示在UINavigationBar中，改变UINavigationItem只会在当前控制器起作用，不会影响其它控制器。

//    self.navigationItem.backBarButtonItem; //设置leftBarButtonItem后，默认的backBarButtonItem会失效
    
    UIBarButtonItem * leftItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(leftClick)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rightClick)];
    UILabel * label = [[UILabel alloc]init];
    label.frame = CGRectMake(0, 0, 40, 44);
    label.text = @"test";
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor purpleColor];
    UIBarButtonItem * customItem = [[UIBarButtonItem alloc]initWithCustomView:label];
    NSArray * arr = [NSArray arrayWithObjects:rightItem, customItem, nil];
    self.navigationItem.rightBarButtonItems = arr;
    
    self.view.backgroundColor = [UIColor blueColor];

/***************************基础end***************************/
    
}

- (void) leftClick {
    NSLog(@"左边点击了");
    [self.navigationController popViewControllerAnimated:YES];
    //也可以指定控制器 popToViewController
    //也可到root控制器 popToRootViewController
}

- (void) rightClick {
    NSLog(@"右边点击了");
}
- (IBAction)navigationbarClick:(id)sender {
    UINavigationBarViewController * vc = [[UINavigationBarViewController alloc]initWithNibName:@"UINavigationBarViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
