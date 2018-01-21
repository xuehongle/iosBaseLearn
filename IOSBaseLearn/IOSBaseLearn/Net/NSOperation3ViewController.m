//
//  NSOperation3ViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/8/28.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "NSOperation3ViewController.h"
#import "CustomOperation.h"

@interface NSOperation3ViewController ()
@property (nonatomic, strong) NSOperationQueue *opQueue;
- (IBAction)btnClick:(id)sender;

@end

@implementation NSOperation3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (NSOperationQueue *)opQueue {
    if (_opQueue == nil) {
        _opQueue = [[NSOperationQueue alloc] init];
    }
    return _opQueue;
}

- (IBAction)btnClick:(id)sender {
    // 1. 实例化对象
    CustomOperation * op = [[CustomOperation alloc]init];
    // 2. 设置操作的参数
    op.urlString = @"http://xxx.com";
    // 2.1 设置 completionBlock
    op.completionBlock = ^{
        NSLog(@"完成!!! %@", [NSThread currentThread]);
    };
    // 2.2 设置 success
    op.successed = ^ (UIImage *image) {
        NSLog(@"success !!! -- %@ %@", image, [NSThread currentThread]);
    };
    // 3. 将操作添加到队列，等待队列的调度，等执行的时候，在main方法中，就可以访问到属性的内容
    [self.opQueue addOperation:op];
}
@end
