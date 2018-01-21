//
//  ImageEnumViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/8/30.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "ImageEnumViewController.h"

typedef enum {
    CZActionTop =       1 << 0,
    CZActionBottom =    1 << 1,
    CZActionLeft =      1 << 2,
    CZActionRight =     1 << 3
} CZActionType;

@interface ImageEnumViewController ()

@end

@implementation ImageEnumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // | 按位或 有1就是1
    // & 按位与 有0就是0
//        [self demo:CZActionTop | CZActionRight | CZActionLeft | CZActionBottom];
    // 位移枚举，如果传入0，表示什么附加操作也不做，意味着执行效率最高！
    // 在任何 C 语言的程序中，只要看到位移的枚举，同时不希望使用任何附加操作，就可以使用 0！
    /**
     NS_OPTIONS 定义的就是位移(掩码)的枚举 => 就可以传入 0
     NS_ENUM    定义的就是普通的枚举
     
     定义枚举的时候，不仅定义了枚举的类型名称，同时定义了枚举的数据类型！
     */
    [self demo:0];
}

/**
 需求：传入一个 type 值，就能够判断用户的所有操作方向！
 */
- (void)demo:(CZActionType)type {
    
    NSLog(@"type: %d", type);
    
    if (type & CZActionTop) {
        NSLog(@"上 %d", type & CZActionTop);
    }
    // 提示：不能有else!
    if (type & CZActionBottom) {
        NSLog(@"下 %d", type & CZActionBottom);
    }
    if (type & CZActionLeft) {
        NSLog(@"左 %d", type & CZActionLeft);
    }
    if (type & CZActionRight) {
        NSLog(@"右 %d", type & CZActionRight);
    }
    
}

@end
