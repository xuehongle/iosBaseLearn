//
//  NSOperation2ViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/8/18.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "NSOperation2ViewController.h"

@interface NSOperation2ViewController ()

@property (nonatomic, strong) NSOperationQueue *opQueue;

- (IBAction)btnStartClick:(id)sender;
- (IBAction)btnPauseClick:(id)sender;
- (IBAction)btnCancelClick:(id)sender;
- (IBAction)btnDependencyClick:(id)sender;

@end

@implementation NSOperation2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _opQueue = [[NSOperationQueue alloc] init];
}


- (IBAction)btnStartClick:(id)sender {
    // 设置最大并发的操作数量，默认是 -1，表示不限制
    self.opQueue.maxConcurrentOperationCount = 2;
    NSLog(@"start");
    
    for (int i = 0; i < 20; ++i) {
        [self.opQueue addOperationWithBlock:^{
            [NSThread sleepForTimeInterval:1.0];
            NSLog(@"%@ %d", [NSThread currentThread], i);
        }];
    }
}
/**
 技巧：
 tu，可以自动根据cpu的位数调整输出的"无符号整数"的格式
 zd，可以自动根据cpu的位数调整输出的"有符号整数"的格式
 */
- (IBAction)btnPauseClick:(id)sender {
    // 在设置挂起属性之前，判断当前对列中是否有操作
    if (self.opQueue.operationCount == 0) {
        NSLog(@"没有操作");
        return;
    }
    
    // 设置挂起属性，并不关心对列中当前是否有操作，只是简单的设置属性！
    // 如果对列一旦被挂起，添加的操作就不会被调度了！容易让用户产生困惑
    if (self.opQueue.isSuspended) {
        NSLog(@"继续 %tu", self.opQueue.operationCount);
        self.opQueue.suspended = NO;
    } else {
        // 如果挂起队列，当前"没有完成的操作"，是包含在队列的操作数中的
        NSLog(@"暂停 %tu", self.opQueue.operationCount);
        self.opQueue.suspended = YES;
    }
}

// 有的时候，在调度任务的过程中，不希望后续的所有任务继续了
// 举个例子：下载小说，一下下载了20本，当第一本下载完成，看了一眼就后悔了！
- (IBAction)btnCancelClick:(id)sender {
    // 取消对列中的所有操作，同样不会影响到正在执行中的操作！
    NSLog(@"取消全部 %tu", self.opQueue.operationCount);
    [self.opQueue cancelAllOperations];
}
/**
 举例:下载小说的压缩包，解压缩，通知用户观看，三个操作应该有先后顺序
 */
- (IBAction)btnDependencyClick:(id)sender {
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"下载 %@", [NSThread currentThread]);
    }];
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"解压缩 %@", [NSThread currentThread]);
    }];
    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"通知用户 %@", [NSThread currentThread]);
    }];
    // 设置操作之间的依赖关系，一旦设置依赖关系之后，所有的操作会按照指定的顺序执行
    // 类似于：GCD中的"同步"任务！
    // 解压缩应该在下载之后
    [op2 addDependency:op1];
    [op3 addDependency:op2];
    // 注意不要指定循环依赖
    // 但是：在不同的版本下，执行效果是不一样的，如果用 Mac 10.10 的模拟器，只是不执行操作，但是不会造成死锁！
    //    [op1 addDependency:op3];
    
    [self.opQueue addOperations:@[op1, op2, op3] waitUntilFinished:YES];
    // 指定依赖关系的操作，是可以“跨对列”的
    // GCD的同步任务同样是可以跨对列的，但是一不小心，就会死锁！
//    [self.opQueue addOperations:@[op1, op2] waitUntilFinished:NO];
//    [[NSOperationQueue mainQueue] addOperation:op3];
    NSLog(@"come here");
}
@end
