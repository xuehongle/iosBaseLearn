//
//  EOCCustomNavBar.h
//  IOSBaseLearn
//
//  Created by xue on 2018/10/17.
//  Copyright © 2018年 xue. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface EOCCustomNavBar : UIView

@property(nonatomic, strong)NSString *title;
@property(nonatomic, strong)UIColor *titleColor;
@property(nonatomic, strong)NSString *leftImage;
@property(nonatomic, strong)NSString *rightImage;
@property(nonatomic, strong)UIButton *leftBtn;
@property(nonatomic, strong)UIButton *rightBtn;
@end

NS_ASSUME_NONNULL_END
