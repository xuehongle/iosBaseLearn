//
//  NSOperationViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/7/14.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "NSOperationViewController.h"

@interface NSOperationViewController ()

@end

@implementation NSOperationViewController
/**
 NSOperation － 操作，也是苹果公司推出的"并发"技术
 
 GCD
 - 是 iOS 4.0 推出的，是 C 语言的，是针对多核推出的并发技术，简化多线程开发
 - 将"任务(block)"添加到队列(串行/并发/全局/主)，并且指定执行任务的方法(同步/异步)
 - 特殊功能
 * 延时操作
 * 一次性
 * 调度组(op可以做类似的，但是做不了太复杂的)
 NSOperation
 - 是 OC 的，是对 GCD 的封装，是 iOS 2.0 推出的，是 GCD 推出之后，苹果对 NSOperation 底层重新编写过！
 - 将"操作(异步的任务)"添加到队列(全局)
 - 提供了一些 GCD 不好实现的功能
 * 限制同时并发的操作数量，iOS 7.0 之前，使用 GCD 或者 NSOperatioin 最大的线程数一般只有 5~6 条，iOS 8.0 之后，线程数量会很大
 * 暂停／继续／取消队列的所有任务！
 * 能够指定任务的"依赖"关系(GCD中的同步任务的替代！)
 
 - NSOperation 是一个"抽象类"，不能直接使用，定义了子类共有的属性和方法
 - 在苹果的头文件中，通常抽象类和子类的定义是在同一个头文件中！
 - 子类
 * NSInvocationOperation (调度，操作)
 * NSBlockOperation (块)
 - NSOperationQueue 队列
 
 目前学习过的抽象类
 - UIGestureRecognizer
 - CAAnimation
 - CAPropertyAnimation
 - Basic
 - KeyFrame
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (int i=0; i<3; i++) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        btn.frame = CGRectMake(20, 100 + 50 * i, 200, 40);
        if (i == 0) {
            [btn setTitle:@"NSInvocationOperation" forState:UIControlStateNormal];
        } else if(i == 1) {
            [btn setTitle:@"NSBlockOperation" forState:UIControlStateNormal];
        } else {
            [btn setTitle:@"线程间通讯" forState:UIControlStateNormal];
        }
        
        btn.tag = 101 + i;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    
    
}

- (void) btnClick: (UIButton *) btn {
    if (btn.tag == 101) {
        [self opCreate0];
    } else if (btn.tag == 102) {
        [self opCreate1];
    } else if (btn.tag == 103) {
        [self opRefreshMainUI];
    }
}
/**
 执行效果：会开启多条线程，而且不是顺序执行
 
 与GCD中并发队列&异步执行效果一样！
 
 结论：NSOperation 中
 操作 -> 异步执行的任务
 队列 -> 全局队列
 */
- (void) opCreate0 {
    NSOperationQueue * queue = [[NSOperationQueue alloc]init];
    
    [queue setMaxConcurrentOperationCount:5];//最大并发数
    
    for (int i=0; i<10; i++) {
        NSInvocationOperation * op = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(downloadImage:) object:@(i)];
        [queue addOperation:op];
    }
}

/**
 执行效果：与 NSInvocationOperation 的一样
 不同点：使用 block 来定义操作，所有的代码写在一起，更简单，便于维护！
 */
- (void) opCreate1 {
    NSOperationQueue * queue = [[NSOperationQueue alloc]init];
    for (int i=0; i<10; i++) {
        NSBlockOperation * op = [NSBlockOperation blockOperationWithBlock:^{
            NSLog(@"%@ %@", [NSThread currentThread], @(i));
        }];
        [queue addOperation:op];
    }
}

- (void) opRefreshMainUI {
    NSOperationQueue * queue = [[NSOperationQueue alloc]init];
    [queue addOperationWithBlock:^{
        // 做耗时的操作
        NSLog(@"耗时操作 %@", [NSThread currentThread]);
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            NSLog(@"UIUIUI %@", [NSThread currentThread]);
        }];
    }];
}

- (void)downloadImage:(id)obj {
    NSLog(@"%@ %@", [NSThread currentThread], obj);
}


@end
