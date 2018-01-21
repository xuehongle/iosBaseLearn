//
//  TabBar1ViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/7/12.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "TabBar1ViewController.h"

@interface TabBar1ViewController ()

@end

@implementation TabBar1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor purpleColor];
    
    self.tabBarItem.badgeValue = @"2";
    //TODO X 没点击item的时候不显示badge
    self.tabBarItem.badgeColor = [UIColor blueColor];
}


@end
