//
//  MyTableViewCell.m
//  IOSBaseLearn
//
//  Created by 薛乐 on 2017/11/25.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.label.numberOfLines = 0;
}


@end
