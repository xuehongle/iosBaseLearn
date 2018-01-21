//
//  GCDBaseViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/8/16.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "GCDBaseViewController.h"

@interface GCDBaseViewController ()
- (IBAction)btnClick:(id)sender;

@end

@implementation GCDBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)btnClick:(id)sender {
    [self gcdDemo4];
}

#pragma mark - 最常用的组合 - 线程间通讯
// MARK: 最常用的代码！
- (void)gcdDemo4 {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        // 执行耗时操作！
        NSLog(@"耗时操作 %@", [NSThread currentThread]);
        
        // 更新 UI dispatch_get_main_queue 主队列，专门用来调度任务在主线程上执行的
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"更新UI %@", [NSThread currentThread]);
        });
    });
}

#pragma mark - GCD演练
// MARK: 精简版
/**
 与 NSThread 的对比
 
 1. 所有的代码写在一起的，让代码更加简单，易于阅读和维护
 NSThread 是通过 selector 来调用指定的方法
 2. 使用 GCD 不需要管理线程的创建/销毁/复用的过程！
 如果用 NSThread 显然不好搞！
 */
- (void)gcdDemo3 {
    for (int i = 0; i < 10; ++i) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSLog(@"%@", [NSThread currentThread]);
        });
    }
}

// MARK: 基本演练 － 同步执行任务不开线程
- (void)gcdDemo2 {
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    void (^task)() = ^ {
        NSLog(@"%@", [NSThread currentThread]);
    };
    dispatch_sync(queue, task);
}

// MARK: 基本演练 － 异步执行任务，开线程
- (void)gcdDemo1 {
    // 1. 队列－全局队列
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    // 2. 任务－用 block 定义一个任务
    void (^task)() = ^ {
        NSLog(@"%@", [NSThread currentThread]);
    };
    
    // 3. 指定任务的"执行函数" -> 同步执行/异步执行
    // 同步 - 这一条指令不执行完，"不会"执行下一条语句，顺序执行，不需要开启线程
    // 异步 - 这一条指令不执行完，"就可以"执行下一条语句，会开启线程
    //  "异步"是多线程的代名词
    dispatch_async(queue, task);
}

@end
