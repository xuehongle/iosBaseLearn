//
//  CALayerViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/8/1.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "CALayerViewController.h"
#import "CALayer0ViewController.h"

@interface CALayerViewController ()
- (IBAction)btn0Click:(id)sender;

@end

@implementation CALayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (IBAction)btn0Click:(id)sender {
    UIViewController * vc = [[CALayer0ViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
