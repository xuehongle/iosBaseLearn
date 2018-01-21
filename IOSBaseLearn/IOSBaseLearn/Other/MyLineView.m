//
//  MyLineView.m
//  IOSBaseLearn
//
//  Created by xue on 2017/7/28.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "MyLineView.h"

@implementation MyLineView

// 当自定义view第一次显示出来的时候就会调用drawRect方法
- (void)drawRect:(CGRect)rect {
    // 1.取得和当前视图相关联的图形上下文(因为图形上下文决定绘制的输出目标)/
    
    // 如果是在drawRect方法中调用UIGraphicsGetCurrentContext方法获取出来的就是Layer的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.绘图(绘制直线), 保存绘图信息
    // 设置起点
    CGContextMoveToPoint(ctx, 10, 50);
    // 设置终点
    CGContextAddLineToPoint(ctx, 100, 50);
    
    // 设置绘图状态
    // 设置线条颜色 红色
    CGContextSetRGBStrokeColor(ctx, 1.0, 0, 0, 1.0);
    // 设置线条宽度
    CGContextSetLineWidth(ctx, 10);
    // 设置线条的起点和终点的样式
    CGContextSetLineCap(ctx, kCGLineCapRound);
    // 设置线条的转角的样式
    CGContextSetLineJoin(ctx, kCGLineJoinRound);
    // 绘制一条空心的线
    CGContextStrokePath(ctx);
    
    /*------------------华丽的分割线---------------------*/
    
    // 重新设置第二条线的起点
    CGContextMoveToPoint(ctx, 100, 50);
    // 设置第二条直线的终点(自动把上一条直线的终点当做起点)
    CGContextAddLineToPoint(ctx, 150, 10);
    // 设置第二条线的颜色 绿色
    //    [[UIColor greenColor] set];
    CGContextSetRGBStrokeColor(ctx, 0, 1.0, 0, 1.0);
    
    // 绘制图形(渲染图形到view上)
    // 绘制一条空心的线
    CGContextStrokePath(ctx);
}

@end
