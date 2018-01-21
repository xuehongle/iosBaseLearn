//
//  Block2ViewController.h
//  IOSBaseLearn
//
//  Created by xue on 2017/8/9.
//  Copyright © 2017年 xue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface Block2ViewController : BaseViewController

// 定义一个块代码的属性，block属性需要用 copy
@property (nonatomic, copy) void (^complete) (NSString * text);
@end
