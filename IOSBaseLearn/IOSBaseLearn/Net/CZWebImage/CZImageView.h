//
//  CZImageView.h
//  02-自定义NSOpeation(掌握)
//
//  Created by teacher on 15-2-2.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CZImageView : UIImageView

/**
 根据指定的 url 字符串，下载图像
 */
- (void)setImageWithURLString:(NSString *)urlString;

@end
