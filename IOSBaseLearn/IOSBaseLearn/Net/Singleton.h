//
//  Singleton.h
//  IOSBaseLearn
//
//  Created by xue on 2017/8/17.
//  Copyright © 2017年 xue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Singleton : NSObject

/**
 *  用 dispatch_once 建立的对象
 */
+ (instancetype)sharedSingleton;

/**
 *  用互斥锁建立的对象
 */
+ (instancetype)syncSingleton;

@end
