#import <Foundation/Foundation.h>
//解决 Xcode 输出台打印 NSArray 数组和 NSDictionary 字典中文乱码的问题
//{
//    success = "\U767b\U5f55\U6210\U529f";
//}
//会在xcode的输出台显示
//{
//    success = 登录成功;
//}

@interface NSArray (Log)

@end

@interface NSDictionary (Log)

@end
