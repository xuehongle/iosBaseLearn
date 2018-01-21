//
//  MyCollectionViewCell.m
//  IOSBaseLearn
//
//  Created by xue on 2017/7/18.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "MyCollectionViewCell.h"

@implementation MyCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.iView = [[UIImageView alloc]init];
        self.label = [[UILabel alloc]init];
        [self.contentView addSubview:self.iView];
        [self.contentView addSubview:self.label];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.iView.frame = CGRectMake(0, 0, 100, 100);
    self.label.frame = CGRectMake(0, 70, 100, 30);
    self.label.alpha = 0.5;
    self.label.backgroundColor = [UIColor grayColor];
}

@end
