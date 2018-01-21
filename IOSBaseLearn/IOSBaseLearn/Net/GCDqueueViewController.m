//
//  GCDqueueViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/8/16.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "GCDqueueViewController.h"

@interface GCDqueueViewController ()
- (IBAction)btnClick0:(id)sender;
- (IBAction)btnClick1:(id)sender;
- (IBAction)btnClick2:(id)sender;
- (IBAction)btnClick3:(id)sender;
- (IBAction)btnClick4:(id)sender;
- (IBAction)btnClick5:(id)sender;


@end

@implementation GCDqueueViewController
/**
 GCD 核心概念
 
 - 队列－负责"调度"任务
 * "串行"队列 - 一个接一个 - 一个任务不调度完，"不会"调度下一个
 * "并发"队列 - 可以同时的 - 一个任务不调度完，"可以"调度下一个
 * 主队列 - 负责在主线程上调度任务，实现线程间通讯
 注意：主队列不是主线程
 * 全局队列 - 为了方便程序员使用，提供的一个全局队列，可以直接 get
 全局队列就是并发队列，执行效果和自己创建的并发队列完全一样！
 
 * 问题：全局队列&并发队列
 - 全局队列没有名字
 无论 MRC & ARC 都不需要考虑释放
 - 并发队列有名字，和 NSThread 的 name 属性很像
 如果在 MRC 开发时，需要使用 dispatch_release(q); 释放相应的对象
 
 - 如果我们前期日常开发中，建议使用"全局队列"
 - 并发队列，是在专业的应用程序或者第三方框架中使用的
 
 - 任务(名词) - 是用 block 封装的一个代码块
 block 是一组预先转被好的代码，在需要的时候执行！
 
 - 指定任务执行的函数(动词)
 dispatch_async  - 异步执行
 * 这一句话不执行完，就可以执行下一句
 * 不是阻塞式的
 * 异步是多线程的代名词
 
 dispatch_sync   - 同步执行
 * 这一句不执行完，不能执行下一句
 * 是阻塞式的
 * 不会开启线程
 
 - 小结
 - 开不开线程由执行任务的函数决定
 * 异步开，多线程的代名词
 * 同步不开
 - 异步执行的函数，开几条线程由队列决定
 * 串行队列 开一条线程
 * 并发队列 开多条线程
 并发功能只有在异步（dispatch_async）函数下才有效
 
 - 队列的选择
 * 多线程的目的：将耗时的操作放在后台执行！
 
 * 串行队列(斯坦福大学的视频)，只开一条线程，所有任务顺序执行
 * 如果任务有先后执行顺序的要求
 * 效率低 -> 执行慢，"省电"
 * 有的时候，用户其实不希望太快！使用 3G 流量，"省钱"
 
 * 并发队列，会开启多条线程，所有任务不按照顺序执行
 * 如果任务没有先后执行顺序的要求
 * 效率高 -> 执行快，"费电"
 * WIFI，包月
 
 - 在实际开发中，线程数量如何决定?
 * WIFI 线程数 6 条
 * 3G / 4G 移动开发的时候，2~3条，再多会费电费钱！
 
 - 同步任务的作用 - "依赖"唯一
 在多线程开发的时候，有的时候，需要使用同步任务，挡住后面的异步任务，
 让所有后续的任务，都等待同步任务执行完成之后，才能继续
 
 * 所有后续的任务，都"依赖"最前面的同步任务
 
 "异步是多线程的代名词!"
 */
- (void)viewDidLoad {
    [super viewDidLoad];
}

//同步任务串行队列 （不用!）
/**
 提问：执行顺序，会开启线程吗？come here?
 猜测：顺序，不开，最后！
 结果：全中
 
 原因：串行队列一个接一个的调度任务  -> 顺序的
 同步执行，本身不需要开线程
 */
- (IBAction)btnClick0:(id)sender {
    // 1. 队列
    /**
     参数：
     1. 队列的名称
     2. 队列的属性 - 指定是什么类型的队列
     DISPATCH_QUEUE_SERIAL           串行
     - NULL
     DISPATCH_QUEUE_CONCURRENT       并发
     - 太长，使用 \ 拼接
     */
    // 以下两句代码是等价的！
    //    dispatch_queue_t q = dispatch_queue_create("xue", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t q = dispatch_queue_create("xue", NULL);
    
    // 2. 指定任务执行的函数
    for (int i = 0; i < 10; ++i) {
        NSLog(@"%d------", i);
        
        dispatch_sync(q, ^{
            NSLog(@"%@ %d", [NSThread currentThread], i);
        });
    }
    NSLog(@"come here");
}

//同步任务并发队列
/**
 提问：执行顺序，会开启线程吗？come here?
 猜测：顺序，开"一条"，不是最后?
 结果：顺序，不开线程，最后
 
 并发队列：可以同时调度多个任务
 同步执行：不会开启线程
 */
- (IBAction)btnClick1:(id)sender {
    // 1. 队列
    dispatch_queue_t q = dispatch_queue_create("xue1", DISPATCH_QUEUE_CONCURRENT);
    
    // 2. 任务
    for (int i = 0; i < 10; ++i) {
        NSLog(@"%d------", i);
        dispatch_sync(q, ^{
            NSLog(@"%@ %d", [NSThread currentThread], i);
        });
    }
    
    NSLog(@"come here");
}

//异步任务串行队列
/**
 提问：执行顺序，会开启线程吗？come here?
 猜测：顺序，开"一条"，不是最后
 结果：全中
 
 原因：
 队列：一个接一个，最多只需要开一个就可以
 任务：异步，会开启线程
 */
- (IBAction)btnClick2:(id)sender {
    // 1. 队列
    dispatch_queue_t q = dispatch_queue_create("xue2", NULL);
    
    // 2. 执行任务的函数
    for (int i = 0; i < 10; ++i) {
        NSLog(@"%d------", i);
        
        dispatch_async(q, ^{
            NSLog(@"%@ %d", [NSThread currentThread], i);
        });
    }
    NSLog(@"come here");
}

//异步任务并发队列
/**
 提问：执行顺序，会开启线程吗？come here?
 猜测：不是顺序，开"多条"，不是最后
 结果：全中
 
 并发队列：同时调度多个任务
 异步执行：会开启线程
 */
- (IBAction)btnClick3:(id)sender {
    // 1. 队列
    dispatch_queue_t q = dispatch_queue_create("xue3", DISPATCH_QUEUE_CONCURRENT);
    
    // 2. 执行任务
    for (int i = 0; i < 10; ++i) {
        NSLog(@"%d------", i);
        dispatch_async(q, ^{
            NSLog(@"%@ %d", [NSThread currentThread], i);
        });
    }
    
    NSLog(@"come here");
}

// MARK: 主队列，异步执行
/**
 提问：执行顺序，会开启线程吗？come here?
 猜测：顺序，不会，最后！
 答案：顺序，不会，最前
 */
- (IBAction)btnClick4:(id)sender {
    // 1. 队列，主队列->主队列是随着程序启动就存在的->主队列不需要创建，可以直接获取
    dispatch_queue_t q = dispatch_get_main_queue();
    
    // 2. "异步"执行
    for (int i = 0; i < 10; ++i) {
        dispatch_async(q, ^{
            NSLog(@"%@ %d", [NSThread currentThread], i);
        });
    }
    NSLog(@"睡会");
    [NSThread sleepForTimeInterval:2.0];
    NSLog(@"come here");
}

// MARK: 主队列，同步执行
/**
 提问：come here?
 猜测：最后/没有！
 答案：死锁！
 */
- (IBAction)btnClick5:(id)sender {
    dispatch_queue_t q = dispatch_get_main_queue();
    NSLog(@"!!!");
    
    dispatch_sync(q, ^{
        NSLog(@"%@", [NSThread currentThread]);
    });
    
    NSLog(@"come here");
}

@end
