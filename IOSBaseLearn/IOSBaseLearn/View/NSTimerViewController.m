//
//  NSTimerViewController.m
//  IOSBaseLearn
//
//  Created by 薛乐 on 2017/7/6.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "NSTimerViewController.h"

@interface NSTimerViewController ()

@property (nonatomic, strong) NSTimer * timer;
@end

@implementation NSTimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(100, 100, 80, 30);
    [btn setTitle:@"启动定时器" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(startTimer) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton * btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn1.frame = CGRectMake(100, 200, 80, 30);
    [btn1 setTitle:@"停止计时器" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(stopTimer) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIView * view = [[UIView alloc]init];
    view.frame = CGRectMake(0, 65, 50, 50);
    view.tag = 101;
    view.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:view];
}

- (void) startTimer {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(updateTimer:) userInfo:@"小明" repeats:YES];
}

- (void) stopTimer {
    [self.timer invalidate];
}

- (void) updateTimer : (NSTimer *) timer {
    NSLog(@"参数: %@", timer.userInfo);
    
    UIView * view = [self.view viewWithTag:101];
    view.frame = CGRectMake(view.frame.origin.x + 1, view.frame.origin.y + 1, view.frame.size.width, view.frame.size.height);
}

- (void)viewDidDisappear:(BOOL)animated {
    [self.timer invalidate];
    self.timer = nil;
}

@end
