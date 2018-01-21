//
//  ImageCategoryViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/8/29.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "ImageCategoryViewController.h"
#import "UIImageView+Param.h"

@interface ImageCategoryViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ImageCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView.urlString = @"UIImageView分类加的参数";
    
    self.label.text = @"点击屏幕获取";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.label.text = self.imageView.urlString;
}

@end
