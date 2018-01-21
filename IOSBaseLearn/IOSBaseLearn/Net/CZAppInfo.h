//
//  CZAppInfo.h
//  03-加载网络图片
//
//  Created by teacher on 15-2-1.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CZAppInfo : NSObject

/**
 *  应用程序名称
 */
@property (nonatomic, copy) NSString *name;
/**
 *  下载数量
 */
@property (nonatomic, copy) NSString *download;
/**
 *  图标的地址
 */
@property (nonatomic, copy) NSString *icon;
/**
 *  从网络下载的图像, 解决列表图片混乱和重复下载的问题
 */
@property (nonatomic, strong) UIImage *image;

+ (instancetype)appInfoWithDict:(NSDictionary *)dict;

@end
