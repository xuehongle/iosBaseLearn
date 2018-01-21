//
//  UIImageView+Param.m
//  IOSBaseLearn
//
//  Created by xue on 2017/8/29.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "UIImageView+Param.h"
// 1. 导入头文件
#import <objc/runtime.h>

const void *urlKey = "helloKey";

@implementation UIImageView (Param)

- (void)setUrlString:(NSString *)urlString {
    // 设置关联对象 - 动态添加属性
    /**
     参数
     1. 对象 - 给谁添加属性
     2. key - 常量 @"hello"
     3. value － 给动态属性设置的数值
     4. 指定属性的引用关系
     OBJC_ASSOCIATION_ASSIGN = 0            // assgin 指向的对象在释放的时候，指针地址不会变化
     // MRC 中要弱引用都是 assign，野指针非常频繁
     // weak指向的对象在释放的时候，指针会被复位到nil
     OBJC_ASSOCIATION_RETAIN_NONATOMIC = 1  // ARC 中的 strong
     OBJC_ASSOCIATION_COPY_NONATOMIC = 3,
     OBJC_ASSOCIATION_RETAIN = 01401,       // 原子的 strong
     OBJC_ASSOCIATION_COPY = 01403          // 原子的 copy
     */
    objc_setAssociatedObject(self, urlKey, urlString, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)urlString {
    /**
     参数
     1. 对象
     2. key
     */
    return objc_getAssociatedObject(self, urlKey);
}


@end
