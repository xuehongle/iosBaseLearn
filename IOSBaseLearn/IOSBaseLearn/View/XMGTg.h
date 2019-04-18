//
//  XMGTg.h
//  02-自定义等高的cell-代码-frame01
//
//  Created by xiaomage on 16/1/8.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMGTg : NSObject
/** 图标 */
@property (nonatomic, copy) NSString *icon;

/** 标题 */
@property (nonatomic, copy) NSString *title;

/** 价格 */
@property (nonatomic, copy) NSString *price;

/** 购买数 */
@property (nonatomic, copy) NSString *buyCount;

//+ (instancetype)tgWithDict:(NSDictionary *)dict;
@end
