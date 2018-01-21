//
//  SizeClassViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/8/14.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "SizeClassViewController.h"

@interface SizeClassViewController ()

@end

@implementation SizeClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

/*
1>.为什么苹果推出SizeClasses
iPhone3gs-4s : frame直接写死
iPad : autoresizing—>根据父控件frame发生改变,子控件跟着一起改变
iPhone5-iPhone5s : autolayout —>自动布局
iPhone6和iPhone6p : size Classes—>发现屏幕变的太多样化,界面大统一

2> sizeclass
* 仅仅是对屏幕进行了分类, 真正排布UI元素还得使用autolayout
* 不再有横竖屏的概念, 只有屏幕尺寸的概念
* 不再有具体尺寸的概念, 只有抽象尺寸的概念
* 把宽度和高度各分为3种情况
1) Compact : 紧凑(小)
2) Any : 任意
3) Regular : 宽松(大)
 
 xcode8里面没有了any
 */
@end
