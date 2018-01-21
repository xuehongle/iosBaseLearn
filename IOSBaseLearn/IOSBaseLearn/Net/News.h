//
//  News.h
//  08-字典转模型
//
//  Created by teacher on 15-2-8.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface News : NSObject
/**
 *  标题
 */
@property (nonatomic, copy) NSString *title;
/**
 *  图片url
 */
@property (nonatomic, copy) NSString *imgsrc;
/**
 *  发布日期
 */
@property (nonatomic, copy) NSString *ptime;
/**
 *  评论数量
 */
@property (nonatomic, copy) NSNumber *replyCount;
@end
