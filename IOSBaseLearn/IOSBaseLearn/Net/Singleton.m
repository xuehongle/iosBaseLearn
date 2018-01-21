//
//  Singleton.m
//  IOSBaseLearn
//
//  Created by xue on 2017/8/17.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton

+ (instancetype)sharedSingleton {
    // 永远只有一个实例，因此需要保存在静态区，随着应用程序启动就分配空间，随着应用程序一起被销毁
    static id instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
    });
    
    return instance;
}

+ (instancetype)syncSingleton {
    static id instance;
    @synchronized (self) {
        // 懒加载的写法，不能保证线程安全
        if (instance == nil) {
            instance = [[self alloc]init];
        }
    }
    return instance;
}

@end
