//
//  CAAnimTransitionViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/8/2.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "CAAnimTransitionViewController.h"

@interface CAAnimTransitionViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, assign) int index;
- (IBAction)btnClick:(id)sender;

@end

@implementation CAAnimTransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.index = 1;
    NSString *imageName = [NSString stringWithFormat:@"guide0%d.jpg", self.index];
    _imageView.image = [UIImage imageNamed:imageName];
    
//    UINavigationController就是通过CATransition实现了将控制器的视图推入屏幕的动画效果

}


- (IBAction)btnClick:(id)sender {
    CATransition *transition = [CATransition animation];
    transition.duration = 1;
    transition.type = @"moveIn";
    //    动画过渡方向
    transition.subtype =  kCATransitionFromRight;
    [_imageView.layer addAnimation:transition forKey:nil];
    
    self.index ++ ;
    if (self.index > 3) {
        self.index = 1;
    }
    NSString *imageName = [NSString stringWithFormat:@"guide0%d.jpg", self.index];
    _imageView.image = [UIImage imageNamed:imageName];
}
@end
