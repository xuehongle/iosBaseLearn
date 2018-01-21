//
//  ImageStretchingViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/8/3.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "ImageStretchingViewController.h"

@interface ImageStretchingViewController ()

@property (weak, nonatomic) IBOutlet UIButton *btn;
@end

@implementation ImageStretchingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image = [UIImage imageNamed:@"RedButton"];
    CGFloat top = 25; // 顶端盖高度
    CGFloat bottom = 25 ; // 底端盖高度
    CGFloat left = 10; // 左端盖宽度
    CGFloat right = 10; // 右端盖宽度
    UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
    // 伸缩后重新赋值
    image = [image resizableImageWithCapInsets:insets];
    [self.btn setBackgroundImage:image forState:UIControlStateNormal];
}


@end
