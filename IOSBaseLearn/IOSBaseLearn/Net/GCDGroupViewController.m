//
//  GCDGroupViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/8/17.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "GCDGroupViewController.h"

@interface GCDGroupViewController ()
- (IBAction)btnClick:(id)sender;

@end

@implementation GCDGroupViewController

/**
 需求：下载完三张图片后再更新UI
 */
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)btnClick:(id)sender {
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_group_async(group, queue, ^{
        [NSThread sleepForTimeInterval:1.0];
        NSLog(@"下载图片 A, %@", [NSThread currentThread]);
    });
    dispatch_group_async(group, queue, ^{
        [NSThread sleepForTimeInterval:1.0];
        NSLog(@"下载图片 B, %@", [NSThread currentThread]);
    });
    dispatch_group_async(group, queue, ^{
        [NSThread sleepForTimeInterval:1.0];
        NSLog(@"下载图片 C, %@", [NSThread currentThread]);
    });
    
    // 监听工作是异步的！
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"三张图片都ok了，可更新UI %@", [NSThread currentThread]);
    });
    NSLog(@"come here");
}
@end
