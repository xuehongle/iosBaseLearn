//
//  SuperView.h
//  IOSBaseLearn
//
//  Created by 薛乐 on 2017/7/10.
//  Copyright © 2017年 xue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SuperView : UIView

@property (nonatomic, strong) UIView * view0; //xib创建的是weak，代码的是strong，xib对view0有强引用
@property (nonatomic, strong) UIView * view1;
@property (nonatomic, strong) UIView * view2;
@property (nonatomic, strong) UIView * view3;

- (void) createSubViews;
@end
