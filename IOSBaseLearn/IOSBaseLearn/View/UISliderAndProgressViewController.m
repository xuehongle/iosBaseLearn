//
//  UISliderAndProgressViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/7/7.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "UISliderAndProgressViewController.h"

@interface UISliderAndProgressViewController ()

@end

@implementation UISliderAndProgressViewController

UILabel * labelSlider;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(10, 65, 230, 40)];
    label.text = @"默认progerssView";
    [self.view addSubview:label];
    
    UIProgressView * progressView = [[UIProgressView alloc]init];
    //progressView的高设置并没有用
    progressView.frame = CGRectMake(10, 100, 300, 40);
    progressView.progress = 0.5;
    [self.view addSubview:progressView];
    
    UILabel * label1 = [[UILabel alloc]initWithFrame:CGRectMake(10, 110, 230, 40)];
    label1.text = @"修改progerssView";
    [self.view addSubview:label1];
    
    UIProgressView * progressView1 = [[UIProgressView alloc]initWithFrame:CGRectMake(10, 150, 320, 40)];
    progressView1.progress = 0.3;
    progressView1.progressTintColor = [UIColor greenColor];
    progressView1.trackTintColor = [UIColor purpleColor];
    progressView1.progressViewStyle = UIProgressViewStyleDefault;
    
    [self.view addSubview:progressView1];
    
    //uislider的高设置并没有用
    UISlider * slider = [[UISlider alloc]initWithFrame:CGRectMake(10, 170, 320, 40)];
    slider.value = 0.5;
    
    [self.view addSubview:slider];
    
    UISlider *slider1 = [[UISlider alloc]init];
    slider1.frame = CGRectMake(10, 200, 320, 40);
    slider1.maximumValue = 100;
    slider1.minimumValue = 0;
    slider1.value = 30;
    slider1.maximumTrackTintColor = [UIColor greenColor];
    slider1.minimumTrackTintColor = [UIColor orangeColor];
    slider1.thumbTintColor = [UIColor blueColor];
    [slider1 addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:slider1];
    
    labelSlider = [[UILabel alloc]initWithFrame:CGRectMake(10, 230, 230, 40)];
    [self.view addSubview:labelSlider];
}

- (void) valueChanged: (UISlider *) slider {
    labelSlider.text = [NSString stringWithFormat:@"%f", slider.value];
}

@end
