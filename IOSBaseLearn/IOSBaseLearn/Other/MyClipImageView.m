//
//  MyClipImageView.m
//  IOSBaseLearn
//
//  Created by xue on 2017/7/31.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "MyClipImageView.h"

@implementation MyClipImageView

- (void)drawRect:(CGRect)rect {
    // 画圆, 以便于以后指定可以显示内容范围
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, 140, 140));
    
    // 指定上下文中可以显示内容的范围
    CGContextClip(ctx);
    
    CGContextStrokePath(ctx);
    
    UIImage *image = [UIImage imageNamed:@"tom3"];
    
    // 按照原始大小绘制
    [image  drawAtPoint:CGPointMake(0, 0)];
    
    
//    CGContextAddRect(ctx, CGRectMake(10, 10, 100, 100));
    
    CGContextFillPath(ctx);
}

@end
