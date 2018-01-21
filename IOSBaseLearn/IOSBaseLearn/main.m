//
//  main.m
//  IOSBaseLearn
//
//  Created by xue on 2017/7/5.
//  Copyright © 2017年 xue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        //参数1和参数2是c的，个数和参数， 参数3rincipalClassName是nil，那么它的值将从Info.plist中获取，如果Info.plist中没有，则默认为UIApplication。
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
