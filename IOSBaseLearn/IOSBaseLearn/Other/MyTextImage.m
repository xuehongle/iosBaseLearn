//
//  MyTextImage.m
//  IOSBaseLearn
//
//  Created by xue on 2017/7/28.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "MyTextImage.h"

@implementation MyTextImage

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    //    [self test];
    //    1.加载图片到内存中
    UIImage *image = [UIImage imageNamed:@"tom3.png"];
    
    
    
    // 利用OC方法将图片绘制到layer上
    // 将图片绘制到指定的位置
    //    [image drawAtPoint:CGPointMake(0, 0)];
    
    // 利用drawInRect方法绘制图片到layer, 是通过拉伸原有图片
    //    [image drawInRect:CGRectMake(0, 0, 200, 200)];
    
    // 利用drawAsPatternInRec方法绘制图片到layer, 是通过平铺原有图片
    [image drawAsPatternInRect:CGRectMake(0, 0, 320, 480)];
    
    [self test];
    
    
}

- (void)test
{
    // 画文字
    NSString *str = @"获取上下文绘图矩形设置文字颜色 设置文字大小将文字绘制到指定的范围内, 如果一行装不下会自动换行, 当文字超出范围后就不显示";
    
    // 1.获取上下文
    //    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 2.绘图
    // 不推荐使用C语言的方法绘制文字, 因为quraz2d中的坐标系和UIkit中的坐标系不一致, 绘制出来的文字是颠倒的, 而且通过C语言的方法绘制文字相当麻烦
    //    CGContextSelectFont(<#CGContextRef c#>, <#const char *name#>, <#CGFloat size#>, <#CGTextEncoding textEncoding#>)
    //    CGContextShowText(ctx, <#const char *string#>, <#size_t length#>)
    
    // 绘制矩形
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 2.绘图
    CGContextAddRect(ctx, CGRectMake(50, 50, 60, 60));
    // 3.渲染
    CGContextStrokePath(ctx);
    
    
    NSMutableDictionary *md = [NSMutableDictionary dictionary];
    // 设置文字颜色
    md[NSForegroundColorAttributeName] =[UIColor redColor];
    // 设置文字背景颜色
    md[NSBackgroundColorAttributeName] = [UIColor greenColor];
    // 设置文字大小
    md[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    
    //    将文字绘制到指点的位置
    //    [str drawAtPoint:CGPointMake(10, 10) withAttributes:md];
    
    //    将文字绘制到指定的范围内, 如果一行装不下会自动换行, 当文字超出范围后就不显示
    [str drawInRect:CGRectMake(50, 50, 100, 100) withAttributes:nil];
    
    
}

@end
