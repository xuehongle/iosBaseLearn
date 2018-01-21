//
//  Quartz2D1ViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/7/31.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "Quartz2D1ViewController.h"

@interface Quartz2D1ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *jiePingLabel;
- (IBAction)btnClick:(id)sender;

@end

@implementation Quartz2D1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}


- (IBAction)btnClick:(id)sender {
    //延迟1 ~2 秒之后再截屏, 因为马上截屏的话，点击的按钮会是点击的状态
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        // 1.创建一个bitmap的上下文
        UIGraphicsBeginImageContext(self.view.frame.size);
        
        // 2.将屏幕绘制到上下文中
        [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
        
        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        
        /*
         // 3.从上下文中取出绘制好的图片
         UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
         
         NSData *data = UIImagePNGRepresentation(newImage);
         
         NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"abc.png"];
         NSLog(@"%@", path);
         [data writeToFile:path atomically:YES];
         */
        
        // 4.保存图片到相册
        
//        This app has crashed because it attempted to access privacy-sensitive data without a usage description.  The app's Info.plist must contain an NSPhotoLibraryUsageDescription key with a string value explaining to the user how the app uses this data.
        UIImageWriteToSavedPhotosAlbum(newImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
        
    });
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    if (error) {
        self.jiePingLabel.text = @"保存失败，请检查是否有访问相册的权限";
    } else {
        self.jiePingLabel.text = @"保存成功了";
    }
}

@end
