//
//  EOCCustomNavBar.m
//  IOSBaseLearn
//
//  Created by xue on 2018/10/17.
//  Copyright © 2018年 xue. All rights reserved.
//

#import "EOCCustomNavBar.h"

@interface EOCCustomNavBar ()


@property(nonatomic, strong)UILabel *titleLabel;

@end
@implementation EOCCustomNavBar

- (instancetype)init
{
    if (self = [super init]) {
        self.frame = CGRectMake(0.0f, 0.0f, [[UIScreen mainScreen] bounds].size.width, 64.0f);
    }
    
    return self;
}

//懒加载view
- (UIButton *)leftBtn
{
    if (!_leftBtn) {
        
        _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_leftBtn setBackgroundImage:[UIImage imageNamed:_leftImage] forState:UIControlStateNormal];
        _leftBtn.frame = CGRectMake(15.0f, 32.0f, 22.0f, 16.0f);
        
    }
    return _leftBtn;
}

- (UIButton *)rightBtn
{
    if (!_rightBtn) {
        
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightBtn setBackgroundImage:[UIImage imageNamed:_rightImage] forState:UIControlStateNormal];
        _rightBtn.frame = CGRectMake(self.frame.size.width-37.0f, 30.0f, 22.0f, 22.0f);
        
    }
    return _rightBtn;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = _titleColor;
        _titleLabel.text = _title;
        _titleLabel.center = CGPointMake(self.frame.size.width/2, (self.frame.size.height+20.0f)/2);
        _titleLabel.bounds = CGRectMake(0.0f, 0.0f, 100.0f, self.frame.size.height-20.0f);
    }
    return _titleLabel;
}

//重写三个setter方法
- (void)setTitleColor:(UIColor *)titleColor
{
    _titleColor = titleColor;
    self.titleLabel.textColor = _titleColor;
}

- (void)setLeftImage:(NSString *)leftImage
{
    _leftImage = leftImage;
    [self.leftBtn setBackgroundImage:[UIImage imageNamed:_leftImage] forState:UIControlStateNormal];
}

- (void)setRightImage:(NSString *)rightImage
{
    _rightImage = rightImage;
    [self.rightBtn setBackgroundImage:[UIImage imageNamed:_rightImage] forState:UIControlStateNormal];
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    self.titleLabel.text = title;
}

- (void)layoutSubviews {
    
    [self addSubview:self.leftBtn];
    
    [self addSubview:self.rightBtn];
    
    [self addSubview:self.titleLabel];
    
}

@end
