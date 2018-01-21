//
//  Quartz2DViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/7/28.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "Quartz2DViewController.h"
#import "Quartz2D0ViewController.h"
#import "Quartz2D1ViewController.h"

@interface Quartz2DViewController ()
- (IBAction)btn0Click:(id)sender;
- (IBAction)btn1Click:(id)sender;

@end

@implementation Quartz2DViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)btn0Click:(id)sender {
    UIViewController * vc = [[Quartz2D0ViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)btn1Click:(id)sender {
    UIViewController * vc = [[Quartz2D1ViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
