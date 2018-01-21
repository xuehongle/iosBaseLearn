//
//  CZAppInfo.m
//  03-加载网络图片
//
//  Created by teacher on 15-2-1.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "CZAppInfo.h"

@implementation CZAppInfo

+ (instancetype)appInfoWithDict:(NSDictionary *)dict {
    id obj = [[self alloc] init];
    
    // 利用 KVC 进行字典转模型
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
}
@end
