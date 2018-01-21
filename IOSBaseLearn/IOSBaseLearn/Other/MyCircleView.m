//
//  MyCircleView.m
//  IOSBaseLearn
//
//  Created by xue on 2017/7/28.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "MyCircleView.h"

@implementation MyCircleView

- (void)drawRect:(CGRect)rect
{
    
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 画圆
    CGContextAddArc(ctx, 60, 60, 50, 0, 2 * M_PI, 0);
    
    // 3.渲染 (注意, 画线只能通过空心来画)
    CGContextFillPath(ctx);
    
    [self test];
    [self test2];
    [self test3];
}

- (void)test3
{
    
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 2.画饼状图
    // 画线
    CGContextMoveToPoint(ctx, 150, 50);
    CGContextAddLineToPoint(ctx, 150, 100);
    // 画圆弧
    CGContextAddArc(ctx, 150, 50, 50, M_PI_2, M_PI, 0);
    //    CGContextAddArc(ctx, 100, 100, 50, -M_PI, M_PI_2, 1);
    
    // 关闭路径
    CGContextClosePath(ctx);
    
    
    [[UIColor purpleColor] set];
    // 3.渲染 (注意, 画线只能通过空心来画)
    CGContextFillPath(ctx);
    //    CGContextStrokePath(ctx);
}

- (void)test2
{
    // 画圆弧
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 2.画圆弧
    // x/y 圆心
    // radius 半径
    // startAngle 开始的弧度
    // endAngle 结束的弧度
    // clockwise 画圆弧的方向 (0 顺时针, 1 逆时针)
    //    CGContextAddArc(ctx, 100, 100, 50, -M_PI_2, M_PI_2, 0);
    CGContextAddArc(ctx, 70, 70, 50, M_PI_2, M_PI, 0);
    CGContextClosePath(ctx);
    
    [[UIColor blueColor] set];
    // 3.渲染
    //     CGContextStrokePath(ctx);
    CGContextFillPath(ctx);
}
- (void)test
{
    // 画圆
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 2.画圆
    CGContextAddEllipseInRect(ctx, CGRectMake(50, 50, 50, 50));
    
    [[UIColor greenColor] set];
    
    // 3.渲染
    //    CGContextStrokePath(ctx);
    CGContextFillPath(ctx);
}

@end
