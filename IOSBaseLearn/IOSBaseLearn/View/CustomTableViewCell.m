//
//  CustomTableViewCell.m
//  IOSBaseLearn
//
//  Created by xue on 2017/7/18.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.label = [[UILabel alloc]init];
        self.label.numberOfLines = 0;
        self.iView = [[UIImageView alloc]init];
        [self.contentView addSubview:self.label];
        [self.contentView addSubview:self.iView];
    }
    return self;
}

- (void)layoutSubviews {
    self.label.frame = CGRectMake(0, 0, 80, 40);
    self.iView.frame = CGRectMake(100, 10, 80, 80);
    self.iView.image = [UIImage imageNamed:@"tom3.png"];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
