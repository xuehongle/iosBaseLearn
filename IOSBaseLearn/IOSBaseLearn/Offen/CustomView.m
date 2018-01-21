//
//  CustomView.m
//  IOSBaseLearn
//
//  Created by 薛乐 on 2018/1/4.
//  Copyright © 2018年 xue. All rights reserved.
//

#import "CustomView.h"
@interface CustomView ()


@end

@implementation CustomView

- (void)awakeFromNib {
    [super awakeFromNib];
    self.labelTitle.text = @"xib的awakeFromNib";
    self.labelTitle.numberOfLines = 0;
    self.labelTitle.preferredMaxLayoutWidth = kScreenWidth - 20;
}

@end
