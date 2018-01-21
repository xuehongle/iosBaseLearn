//
//  NSThreadViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/7/14.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "NSThreadViewController.h"

@interface NSThreadViewController ()

@property (nonatomic, assign) int counter;

@end

@implementation NSThreadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (int i=0; i<3; i++) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        btn.frame = CGRectMake(20, 100 + 50*i, 100, 40);
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        if (i == 0) {
            [btn setTitle:@"启动线程阻塞" forState:UIControlStateNormal];
        } else if (i == 1) {
            [btn setTitle:@"启动线程1" forState:UIControlStateNormal];
        } else if (i == 2) {
            [btn setTitle:@"启动线程2" forState:UIControlStateNormal];
        }
        
        [self.view addSubview:btn];
        btn.tag = 101 + i;
    }
}

- (void) btnClick: (UIButton *)btn {
    if (btn.tag == 101) {
        //第一种创建方法
        //        NSThread * thread = [[NSThread alloc]initWithTarget:self selector:@selector(btn0Click) object:nil];
        //        [thread start];
        //用NSThread 可解决阻塞的问题
        [self btn0Click];
    } else if (btn.tag == 102) {
        // 第二种创建方法
        [NSThread detachNewThreadSelector:@selector(btn1Click) toTarget:self withObject:nil];
        // 第三种创建方法
        //        [self performSelectorInBackground:@selector(btn1Click) withObject:nil];
    } else if (btn.tag == 103) {
        [NSThread detachNewThreadSelector:@selector(btn2Click) toTarget:self withObject:nil];
    }
}

- (void) btn0Click {
    int i = 0;
    while (true) {
        i++;
        NSLog(@"i= %d", i);
    }
}

// 两个线程几乎同时操作同一个数据，场景典型是，两个窗口卖票
- (void) btn1Click {
    int i = 0;
    while (true) {
        i++;
        if (i > 10000) {
            break;
        }
//        @property (nonatomic, strong) NSLock *lock; // 好像不可以
        //        [self.lock lock];
        @synchronized(self) { //两个线程同时操作self.counter，导致结果不对，加锁即可解决 synchronized这种互斥锁也可以
            self.counter++;
        }
        //        [self.lock unlock];
        NSLog(@"c1 %d", _counter);
    }
    NSLog(@"btn1 %d", self.counter);
}

- (void) btn2Click {
    int i = 0;
    while (true) {
        i++;
        if (i > 10000) {
            break;
        }
        @synchronized(self) {
            self.counter++;
        }
        NSLog(@"c2 %d", _counter);
    }
    NSLog(@"btn2 %d", self.counter);
}

@end
