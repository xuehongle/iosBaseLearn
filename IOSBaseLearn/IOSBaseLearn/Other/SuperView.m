//
//  SuperView.m
//  IOSBaseLearn
//
//  Created by 薛乐 on 2017/7/10.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "SuperView.h"

@implementation SuperView

- (void) createSubViews {
    self.view0 = [[UIView alloc]init];
    self.view0.frame = CGRectMake(0, 0, 40, 40);
    self.view0.backgroundColor = [UIColor orangeColor];
    [self addSubview:self.view0];
    
    self.view1 = [[UIView alloc]init];
    self.view1.frame = CGRectMake(self.bounds.size.width - 40, 0, 40, 40);
    self.view1.backgroundColor = [UIColor orangeColor];
    [self addSubview:self.view1];
    
    self.view2 = [[UIView alloc]init];
    self.view2.frame = CGRectMake(0, self.bounds.size.height - 40, 40, 40);
    self.view2.backgroundColor = [UIColor orangeColor];
    [self addSubview:self.view2];
    
    self.view3 = [[UIView alloc]init];
    self.view3.frame = CGRectMake(self.bounds.size.width - 40, self.bounds.size.height - 40, 40, 40);
    self.view3.backgroundColor = [UIColor orangeColor];
    [self addSubview:self.view3];
}

- (void)layoutSubviews {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2];
    self.view0.frame = CGRectMake(0, 0, 40, 40);
    self.view1.frame = CGRectMake(self.bounds.size.width - 40, 0, 40, 40);
    self.view2.frame = CGRectMake(0, self.bounds.size.height - 40, 40, 40);
    self.view3.frame = CGRectMake(self.bounds.size.width - 40, self.bounds.size.height - 40, 40, 40);
    [UIView commitAnimations];
}

@end
