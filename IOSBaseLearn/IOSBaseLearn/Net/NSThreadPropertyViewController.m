//
//  NSThreadPropertyViewController.m
//  IOSBaseLearn
//
//  Created by 薛乐 on 2017/8/16.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "NSThreadPropertyViewController.h"

@interface NSThreadPropertyViewController ()

@end

@implementation NSThreadPropertyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self demo];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:btn];
    [btn setTitle:@"name stacksize Priority等属性" forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(threadDemo) forControlEvents:UIControlEventTouchUpInside];
    
    [btn makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.top.equalTo(self.view).offset(70);
    }];
}

#pragma mark - 线程属性
/**
 线程的执行是由 CPU 来调度的，程序员不能参与
 
 提示：在开发多线程程序的时候，不要相信一次执行的结果！
 
 线程的优先级：优先级高的任务只是表示 CPU 调度的频率高！
 误区：优先级高的任务会先执行完！
 
 建议：不要修改线程的优先级，因为做多线程开发最主要的目的，将耗时的操作放在后台！
 修改优先级有一个隐患->优先级翻转
 
 开发多线程程序有一个宝典：尽量的简单！
 */
- (void)threadDemo {
    NSThread *t1 = [[NSThread alloc] initWithTarget:self selector:@selector(demo) object:nil];
    
    // name -> 在商业级应用程序中，通常希望程序崩溃的时候，能够知道准确执行的线程！更容易排错！
    t1.name = @"thread A";
    // 设置堆栈大小(只要知道就行)
    t1.stackSize = 1024 * 1024; // 1M
    
    // 优先级，浮点数，范围从 0～1，1的优先级最高！默认是0.5
    t1.threadPriority = 0.1;
    
    [t1 start];
    
    // ------
    NSThread *t2 = [[NSThread alloc] initWithTarget:self selector:@selector(demo) object:nil];
    t2.threadPriority = 1;
    t2.name = @"thread B";
    [t2 start];
}

/**
 提示，在实际开发中，不同线程调用同一个方法，有可能会产生不同的效果！
 NSThread isMainThread 的判断原因，导致demo在主线程运行时不崩溃，其他线程会崩溃
 */
- (void)demo {
    for (int i = 0; i < 10; ++i) {
        NSLog(@"%@ %@", [NSThread currentThread], @(i));
    }
    
    NSLog(@"堆栈大小 %lu", [NSThread currentThread].stackSize / 1024);
    
    //    // 判断是否是主线程，如果不是，故意弄一个 bug
    //    if (![NSThread isMainThread]) {
    //        NSMutableArray *array = [NSMutableArray array];
    //        // -[__NSArrayM insertObject:atIndex:]: object cannot be nil'
    //        // 在 OC 中不能向数组或者字典插入 nil
    //        [array addObject:nil];
    //    }
}

@end
