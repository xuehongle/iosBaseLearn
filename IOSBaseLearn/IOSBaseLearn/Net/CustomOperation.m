//
//  CustomOperation.m
//  IOSBaseLearn
//
//  Created by xue on 2017/8/28.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "CustomOperation.h"

@implementation CustomOperation
/**
 自定义操作，只需要重写 main 方法，当将操作添加到队列，开始执行的时候，会自动从 main 方法开始！
 
 问题1：main方法没有参数，通过属性传递
 问题2：执行结束，如果通知调用方
 － 代理
 － block，在很多场合，block是可以代替代理的
 
 提示：NSOperation默认提供了一个 completionBlock 的块代码回调
 completionBlock 的特点：
 － 当一个操作执行完毕后，会自动调用
 － 回调所在的线程，和执行 main 方法的线程不在同一个线程
 － 没有返回值，没有参数，使用起来不方便
 
 接下来：自定义 block
 － 很多的第三方框架中，会在异步操作完成后，直接在主线程回调完成block！
 － 调用方，就可以不用关心线程间通讯！
 */
- (void)main {
    @autoreleasepool {
        NSLog(@"come here %@ %@", [NSThread currentThread], self.urlString);
        
        // 耗时的操作
        // 下载图像....
        
        // 执行块代码
        // 1. 判断是否定义了 block
        if (self.successed) {
            // 在主线程回调
            dispatch_async(dispatch_get_main_queue(), ^{
                self.successed(nil);
            });
        }
    }
}
@end
