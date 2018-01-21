//
//  CALayer0ViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/8/1.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "CALayer0ViewController.h"

@interface CALayer0ViewController ()

@property (weak, nonatomic) IBOutlet UIView *customView;
- (IBAction)btnClick:(id)sender;
@end

@implementation CALayer0ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test];
}

- (void) test {
    // 设置layer边框 内边框
    self.customView.layer.borderWidth = 10;
    // 设置layer边框颜色
    self.customView.layer.borderColor =[UIColor blackColor].CGColor;
    // 设置layer的圆角(设置主图层的圆角)
    self.customView.layer.cornerRadius = 10;
    
    
    // 设置超出主图层的部分剪切掉
    //    self.customView.clipsToBounds = YES;
    //    self.customView.layer.masksToBounds = YES;
    
    // 设置的image不是展示在主图层上的, 是展示在子图层上的
    self.customView.layer.contents = (id)[UIImage imageNamed:@"tom3"].CGImage;
    
    
    // 设置阴影颜色
    self.customView.layer.shadowColor = [UIColor purpleColor].CGColor;
    // 设置阴影偏移位
    // 如果为正数, 代表往右边偏移
    self.customView.layer.shadowOffset = CGSizeMake(10, 10);
    // 设置阴影透明的 0~1 1完全不透明 0 完全透明
    self.customView.layer.shadowOpacity = 1;
}

- (IBAction)btnClick:(id)sender {
    /*
     //      self.iconView.transform = CGAffineTransformMakeTranslation(0, -100);
     
     //    self.customView.layer.transform = CATransform3DMakeTranslation(0, -100, 0);
     
     //    NSValue *v = [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(0, -200, 0)];
     //    [self.iconView.layer setValue:v forKeyPath:@"transform"];
     
     [self.customView.layer setValue:@(-100) forKeyPath:@"transform.translation.x"];
     */
    
    /*
     //    self.iconView.transform = CGAffineTransformMakeRotation(M_PI_4);
     //    self.iconView.layer.transform = CATransform3DMakeRotation(M_PI_4, 0, 0, 9998);// X, Y, Z
     //    [self.iconView.layer setValue:@(M_PI_2) forKeyPath:@"transform.rotation.z"];
     */
    
    //        self.iconView.transform = CGAffineTransformMakeScale(0.5, 0.5);
    //    self.customView.layer.transform = CATransform3DMakeScale(1 , 1, 998);
    self.customView.layer.transform = CATransform3DMakeTranslation(0, 100, 0);
}

@end
