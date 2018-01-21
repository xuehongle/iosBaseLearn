//
//  UIDynamicViewController.m
//  IOSBaseLearn
//
//  Created by 薛乐 on 2017/8/13.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "UIDynamicViewController.h"

@interface UIDynamicViewController ()

@property (weak, nonatomic) IBOutlet UIView *blueView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;

// 仿真器
@property (nonatomic, strong)  UIDynamicAnimator *animator;

@end

@implementation UIDynamicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self testGravityAndCollision];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//    // -1.移除所有的仿真行为
//    [self.animator removeAllBehaviors];
//    
//    // 0.获取用户点击的点
//    CGPoint point = [[touches anyObject] locationInView:self.view];
//    
//    // 1.创建仿真行为
//    // 1.1.捕捉行为(捕捉行为在一个仿真中,只能存在一个)
//    UISnapBehavior *snap = [[UISnapBehavior alloc] initWithItem:self.blueView snapToPoint:point];
//    // damping : 设置减震
//    snap.damping = 1.0;
//    
//    // 2.将仿真行为添加到仿真器
//    [self.animator addBehavior:snap];
}

- (void)testGravity2
{
    // 1.创建仿真行为
    // 1.1.创建重力仿真行为(并且指定仿真元素)
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[self.blueView]];
    
    // 1.1.1.设置重力的角度(弧度制:默认就是M_PI_2)
    // gravity.angle = 0;
    // gravity.magnitude = 10.0;
    gravity.gravityDirection = CGVectorMake(1, 3);
    
    // 1.2.创建碰撞仿真行为(并且指定仿真元素)
    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[self.blueView]];
    // 1.2.1.将参照视图的边界作为碰撞边界
    collision.translatesReferenceBoundsIntoBoundary = YES;
    
    // 2.将仿真行为添加到仿真器
    [self.animator addBehavior:gravity];
    [self.animator addBehavior:collision];
}

- (void)testCollision
{
    // 1.创建仿真行为
    // 1.1.创建重力仿真行为(并且指定仿真元素)
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[self.blueView]];
    
    // 1.2.创建碰撞仿真行为(并且指定仿真元素)
    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[self.blueView]];
    // 1.2.1.将参照视图的边界作为碰撞边界
    collision.translatesReferenceBoundsIntoBoundary = YES;
    
    // 1.2.2.添加边界(线)
    // CGPoint fromPoint = CGPointMake(0, self.view.frame.size.height * 0.4);
    // CGPoint toPoint = CGPointMake(self.view.frame.size.width, self.view.frame.size.height * 0.6);
    // [collision addBoundaryWithIdentifier:@"line" fromPoint:fromPoint toPoint:toPoint];
    
    // 1.2.3.添加边界(贝塞尔曲线)
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width)];
    [collision addBoundaryWithIdentifier:@"bezier" forPath:bezierPath];
    
    // 2.将仿真行为添加到仿真器
    [self.animator addBehavior:gravity];
    [self.animator addBehavior:collision];
}

- (void)testGravityAndCollision
{
    // 1.创建仿真行为
    // 1.1.创建重力仿真行为(并且指定仿真元素)
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[self.blueView]];
    
    // 1.2.创建碰撞仿真行为(并且指定仿真元素)
    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[self.blueView, self.segment]];
    // 1.2.1.将参照视图的边界作为碰撞边界
    collision.translatesReferenceBoundsIntoBoundary = YES;
    
    // 2.将仿真行为添加到仿真器
    [self.animator addBehavior:gravity];
    [self.animator addBehavior:collision];
}

- (void)testGravity1
{
    // 1.创建重力仿真行为(并且指定仿真元素)
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[self.blueView]];
    // 2.将仿真行为添加到仿真器
    [self.animator addBehavior:gravity];
}

#pragma mark - 懒加载代码
- (UIDynamicAnimator *)animator
{
    if (_animator == nil) {
        // 创建仿真器(并且指定仿真范围)
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    }
    return _animator;
}

@end
