//
//  PersonBean.h
//  IOSBaseLearn
//
//  Created by xue on 2017/7/27.
//  Copyright © 2017年 xue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonBean : NSObject <NSCoding>

@property (nonatomic, copy) NSString * name;
@property (nonatomic, assign) int age;
@end
