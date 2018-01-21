//
//  PushLocalViewController.m
//  IOSBaseLearn
//
//  Created by 薛乐 on 2017/8/12.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "PushLocalViewController.h"

@interface PushLocalViewController ()
- (IBAction)btnClick:(id)sender;

@end

@implementation PushLocalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (IBAction)btnClick:(id)sender {
    
    /*
     @property(nonatomic,copy) NSDate *fireDate; 通知发出的时间
     @property(nonatomic,copy) NSTimeZone *timeZone; 时区,如果不设置,默认跟随手机的时区
     
     @property(nonatomic) NSCalendarUnit repeatInterval;      设置重复时间(隔多久重复一次)
     @property(nonatomic,copy) NSCalendar *repeatCalendar;    设置具体的日期进行重复
     
     @property(nonatomic,copy) CLRegion *region 设置一个区域(一旦进入该区域的时候,就会发出通知)
     
     @property(nonatomic,assign) BOOL regionTriggersOnce 是否只发送一次(每次进入某一个区域都发一次,还是只发生一次)
     
     @property(nonatomic,copy) NSString *alertBody;      发出通知的内容
     @property(nonatomic) BOOL hasAction;
     @property(nonatomic,copy) NSString *alertAction;
     @property(nonatomic,copy) NSString *alertLaunchImage;   设置启动图片
     
     // sound
     @property(nonatomic,copy) NSString *soundName;      UILocalNotificationDefaultSoundName
     
     // badge
     @property(nonatomic) NSInteger applicationIconBadgeNumber;  设置启动图片(通过通知打开的)
     // user info
     @property(nonatomic,copy) NSDictionary *userInfo;
     */
    
    // 1.创建一个本地通知
    UILocalNotification *localNote = [[UILocalNotification alloc] init];
    
    // 1.1.设置通知发出的时间
    localNote.fireDate = [NSDate dateWithTimeIntervalSinceNow:5];
    
    // 1.2.设置通知内容
    localNote.alertBody = @"这里是内容";
    
    // 1.3.设置锁屏时,字体下方显示的一个文字
    localNote.alertAction = @"这里是滑动来...";
    localNote.hasAction = NO;
    
    // 1.4.设置启动图片(通过通知打开的)
    localNote.alertLaunchImage = @"222";
    
    // 1.5.设置通过到来的声音
    localNote.soundName = UILocalNotificationDefaultSoundName;
    
    // 1.6.设置应用图标左上角显示的数字
    localNote.applicationIconBadgeNumber = 123;
    
    // 1.7.设置一些额外的信息
    localNote.userInfo = @{@"key1" : @"123", @"msg" : @"这里是push带的信息啊"};
    
    // 2.执行通知
    [[UIApplication sharedApplication] scheduleLocalNotification:localNote];

}

@end
