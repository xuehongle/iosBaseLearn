//
//  GCDDelayViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/8/17.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "GCDDelayViewController.h"
#import "Singleton.h"

@interface GCDDelayViewController ()
- (IBAction)btnDelayClick:(id)sender;
- (IBAction)btnOnceClick:(id)sender;
- (IBAction)btnSingletonClick:(id)sender;

@end

@implementation GCDDelayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)btnDelayClick:(id)sender {
    /**
     从现在开始，经过多少纳秒，由"队列"调度异步执行 block 中的代码
     
     参数
     1. when    从现在开始，经过多少纳秒
     2. queue   队列
     3. block   异步执行的任务
     是个异步任务
     */
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"在主线程延时了一秒执行 %@", [NSThread currentThread]);
    });
    
    // 全局队列 延时多长时间后，异步执行某些方法！
    //    dispatch_after(when, dispatch_get_global_queue(0, 0), ^{
    //        NSLog(@"%@", [NSThread currentThread]);
    //    });
    // 串行队列 - 也会开线程！
//    dispatch_after(when, dispatch_queue_create("itcast", NULL), ^{
//        NSLog(@"%@", [NSThread currentThread]);
//    });
}

- (IBAction)btnOnceClick:(id)sender {
    // token 令牌，只要 token == 0，才会执行 block 中的代码
    static dispatch_once_t onceToken;
    
    // 同步执行！可以保证后续的代码能够使用到一次性执行后的结果！
    dispatch_once(&onceToken, ^{
        // 只执行一次
        NSLog(@"%@", [NSThread currentThread]);
    });
    
    NSLog(@"come here");
}

/**
 互斥锁真的没有dispatch_once性能好！
 
 dispatch_once是苹果推荐的一次性执行的解决方案！
 */
- (IBAction)btnSingletonClick:(id)sender {
    long largeNumber = 1000 * 10000;
    
    // 开始时间
    CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
    
    for (int i = 0; i < largeNumber; ++i) {
        [Singleton sharedSingleton];
    }
    
    // 结束时间
    CFAbsoluteTime end = CFAbsoluteTimeGetCurrent();
    NSLog(@"dispatch once %f", end - start);
    
    // 互斥锁
    start = CFAbsoluteTimeGetCurrent();
    for (int i = 0; i < largeNumber; ++i) {
        [Singleton syncSingleton];
    }
    end = CFAbsoluteTimeGetCurrent();
    NSLog(@"互斥锁 %f", end - start);
}

@end
