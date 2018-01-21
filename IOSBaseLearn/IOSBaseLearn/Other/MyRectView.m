//
//  MyRectView.m
//  IOSBaseLearn
//
//  Created by xue on 2017/7/28.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "MyRectView.h"

@implementation MyRectView

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    // 绘制四边形
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 2.绘制四边形
    CGContextAddRect(ctx, CGRectMake(10, 10, 150, 100));
    
    // 如果要设置绘图的状态必须在渲染之前
    //    CGContextSetRGBStrokeColor(ctx, 1.0, 0, 0, 1.0);
    // 绘制什么类型的图形(空心或者实心).就要通过什么类型的方法设置状态
    //    CGContextSetRGBFillColor(ctx, 1.0, 0, 0, 1.0);
    
    // 调用OC的方法设置绘图的颜色
    //    [[UIColor purpleColor] setFill];
    //    [[UIColor blueColor] setStroke];
    // 调用OC的方法设置绘图颜色(同时设置了实心和空心)
    //    [[UIColor greenColor] set];
    [[UIColor colorWithRed:1.0 green:0 blue:0 alpha:1.0] set];
    
    // 3.渲染图形到layer上
    CGContextStrokePath(ctx);
//        CGContextFillPath(ctx);
    test1();
    
}

void test1()
{
    // 1.获取图形上下文
    CGContextRef ctx =  UIGraphicsGetCurrentContext();
    
    // 2. 绘制三角形
    // 设置起点
    CGContextMoveToPoint(ctx, 100, 0);
    // 设置第二个点
    CGContextAddLineToPoint(ctx, 50, 100);
    // 设置第三个点
    CGContextAddLineToPoint(ctx, 150, 100);
    // 设置终点
    //    CGContextAddLineToPoint(ctx, 100, 10);
    // 关闭起点和终点
    CGContextClosePath(ctx);
    [[UIColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:1.0] set];
    // 3.渲染图形到layer上
//    CGContextStrokePath(ctx);
    CGContextFillPath(ctx);
}

@end
