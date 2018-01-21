//
//  AutoLayoutAnimateViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/7/21.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "AutoLayoutAnimateViewController.h"

@interface AutoLayoutAnimateViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstraint;

- (IBAction)btnClick:(id)sender;

@end

@implementation AutoLayoutAnimateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (IBAction)btnClick:(id)sender {
    self.topConstraint.constant += 100;
    
    [UIView animateWithDuration:1.5 animations:^{
        [self.view layoutIfNeeded];
    }];
}
@end
