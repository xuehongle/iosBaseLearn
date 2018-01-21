//
//  MyAnimView.m
//  IOSBaseLearn
//
//  Created by xue on 2017/7/31.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "MyAnimView.h"

@interface MyAnimView ()

@property (nonatomic, assign) int imageY;
@end

@implementation MyAnimView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        //CADisplayLink 和nstimer还是有区别的，是根据系统刷新帧率来调用的，nstimer可设置时间
        CADisplayLink * display = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateImage)];
        [display addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    }
    return self;
}


- (void)updateImage {
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    self.imageY += 5;
    
    if (self.imageY > rect.size.height) {
        self.imageY = 0;
    }
    UIImage *image = [UIImage imageNamed:@"btnbg00.png"];
    [image drawAtPoint:CGPointMake(10, self.imageY)];
}


@end
