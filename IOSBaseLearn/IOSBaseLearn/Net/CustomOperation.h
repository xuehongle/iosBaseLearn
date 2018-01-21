//
//  CustomOperation.h
//  IOSBaseLearn
//
//  Created by xue on 2017/8/28.
//  Copyright © 2017年 xue. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 观察：
 1. 哪些地方用到了这个类型？只有在定义属性那一个地方用到了！
 2. 类型定义在什么位置？是在.h文件，有隐患，如果其他程序的.h文件中同样定义了一个同名的block类型，会产生冲突！
 
 按照苹果官方建议，block的类型定义不要定在 .h 中，如果实在需要，应该定在.m中！
 
 inlineBlock 是可以帮助速记，但是手写block一定要过关！
 */
// 定义一个block的类型
//typedef void(^completion)(UIImage *);

//void demo (UIImage *image) {
//
//}
@interface CustomOperation : NSOperation

/**
 下载图像的 url 地址
 */
@property (nonatomic, copy) NSString *urlString;

/**
 成功的回调－不要使用 completionBlock
 */
@property (nonatomic, copy) void (^successed)(UIImage *image);

//+ (instancetype)downloadImageOpeartionWithURLString:(NSString *)urlString successed:(void (^) (UIImage *image))successed; // 可用类方法

@end
