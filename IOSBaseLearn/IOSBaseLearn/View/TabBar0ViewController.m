//
//  TabBar0ViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/7/12.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "TabBar0ViewController.h"

@interface TabBar0ViewController ()

@end

@implementation TabBar0ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blueColor];
    
    //TODO X tabbar没选中时有默认颜色，导致btnbg00.png不能正常显示
    UITabBarItem * tabBarItem = [[UITabBarItem alloc]initWithTitle:@"tab0Item" image:[UIImage imageNamed:@"btnbg00.png"] selectedImage:[UIImage imageNamed:@"btnbg01.png"]];
    self.tabBarItem = tabBarItem;
}


@end
