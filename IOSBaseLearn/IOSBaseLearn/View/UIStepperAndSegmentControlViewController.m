
//  UIStepperAndSegmentControlViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/7/7.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "UIStepperAndSegmentControlViewController.h"

@interface UIStepperAndSegmentControlViewController ()

@end

@implementation UIStepperAndSegmentControlViewController

// 步进器 分段控制
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIStepper * stepper = [[UIStepper alloc]init];
    //UIStepper 宽高设置并没有用
    stepper.frame = CGRectMake(100, 100, 100, 200);
    stepper.maximumValue = 100;
    stepper.minimumValue = 0;
    stepper.stepValue = 5;
    stepper.value = 10;
    stepper.autorepeat = YES; //长按的时候是否响应
    stepper.continuous = NO; //长按的时候是否响应事件，只有autorepeat=yes的时候有用
    [stepper addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:stepper];
    
    UISegmentedControl * segmentControl = [[UISegmentedControl alloc]init];
    segmentControl.frame = CGRectMake(10, 200, 300, 40);
    [segmentControl insertSegmentWithTitle:@"0元" atIndex:0 animated:YES];
    [segmentControl insertSegmentWithTitle:@"5元" atIndex:1 animated:YES];
    [segmentControl insertSegmentWithTitle:@"10元" atIndex:0 animated:YES];
    
    segmentControl.selectedSegmentIndex = 0;
    [segmentControl addTarget:self action:@selector(segValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:segmentControl];
}

- (void) valueChanged: (UIStepper *) stepper {
    NSLog(@"stepper %f", stepper.value);
}

- (void) segValueChanged: (UISegmentedControl *) segmentControl {
    NSLog(@"%ld", segmentControl.selectedSegmentIndex);
}

@end
