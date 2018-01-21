//
//  AppDelegate.m
//  IOSBaseLearn
//
//  Created by xue on 2017/7/5.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "NetViewController.h"
#import "OtherViewController.h"
#import "BaseNavigationViewController.h"
#import "OffenViewController.h"
#import <UserNotifications/UserNotifications.h>

#define kDeviceVersion  [[UIDevice currentDevice] systemVersion].floatValue

@interface AppDelegate ()

@end

@implementation AppDelegate


// 程序首次已经完成启动时执行，若直接启动，launchOptions中没有数据；否则，launchOptions将包含对应方式的内容（比如从微信中启动节奏大师--），还有推送的时候，点击push跳转的时候，options也有值
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"%s", __FUNCTION__);
    //整个程序中只有一个UIWindow对象
    //self.window是一个UIView, UIView有window属性，但都是同一个UIWindow,  view1.window view2.window
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    BaseNavigationViewController *navVC = [[BaseNavigationViewController alloc]initWithRootViewController:[[ViewController alloc]init]];
    BaseNavigationViewController * navVC2 = [[BaseNavigationViewController alloc]initWithRootViewController:[[NetViewController alloc]init]];
    navVC2.tabBarItem.title = @"Net";
    BaseNavigationViewController * navVC3 = [[BaseNavigationViewController alloc]initWithRootViewController:[[OtherViewController alloc]init]];
    navVC3.tabBarItem.title = @"Other";
    BaseNavigationViewController * navVC4 = [[BaseNavigationViewController alloc]initWithRootViewController:[[OffenViewController alloc]init]];
    navVC4.tabBarItem.title = @"常用";
    
    
    UITabBarController * tabVC = [[UITabBarController alloc]init];
    NSArray * arr = [NSArray arrayWithObjects:navVC, navVC2, navVC3, navVC4, nil];
    tabVC.viewControllers = arr;
    
    self.window.rootViewController = tabVC;
    [self.window makeKeyAndVisible]; //makeKeyAndVisible 让self.widow是keywindow并显示，不然打开是黑屏
    

    
    
    /**
     *  iOS8以后需要注册,才能将未读的数在图标右上角显示
     */
    if (kDeviceVersion >= 8.0) {
//        // 使用本地通知 (本例中只是badge，但是还有alert和sound都属于通知类型,其实如果只进行未读数在appIcon显示,只需要badge就可, 这里全写上为了方便以后的使用)
        //iOS 10 before
//        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert categories:nil];
//        // 进行注册
//        [application registerUserNotificationSettings:settings];
        
        //iOS 10
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        [center requestAuthorizationWithOptions:(UNAuthorizationOptionBadge | UNAuthorizationOptionSound | UNAuthorizationOptionAlert) completionHandler:^(BOOL granted, NSError * _Nullable error) {
            if (!error) {
                NSLog(@"request authorization succeeded! 可以使用通知了");
            }
        }];

    }
    
    /**
     push通知 程序在后台被杀死后，点击push跳转，因为这个时候不再走didReceiveLocalNotification方法
     */
    if (launchOptions[UIApplicationLaunchOptionsLocalNotificationKey]) {
        UILabel *label = [[UILabel alloc] init];
        label.backgroundColor = [UIColor blueColor];
        label.textColor = [UIColor whiteColor];
        label.frame = CGRectMake(0, 0, 300, 300);
        label.text = [NSString stringWithFormat:@"%@", launchOptions];
        label.numberOfLines = 0;
        [self.window.rootViewController.view addSubview:label];
    }
    
    
    return YES;
}


// 当应用程序将要进入非活动状态执行, 比如按下Home键, 有电话信息进来，锁屏等
- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"%s", __FUNCTION__);
    //按下Home键时，先ResignActive再Background，（比较合理的记忆方法），因为到后台有个动画，手快的话还是可以点击的，但这时点击不应该给交互了，所以ResignActive先执行 
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}

// 假若你的程序支持后台，进入后台调用
- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"%s", __FUNCTION__);
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

// 当程序后台进入前台时调用
- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"%s", __FUNCTION__);
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}

// 当程序进入活动状态时执行
- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"%s", __FUNCTION__);
    UIApplication * app = [UIApplication sharedApplication];
    app.applicationIconBadgeNumber = 0;
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

// 程序将要退出时调用，通常用来保存数据和一些退出前的清理工作
- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"%s", __FUNCTION__);
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


/**
 *  程序在后台没有被杀死,本地通知打开应用的时候会调用该方法
 *  程序在前台的时候
 *
    而远程推送的时候是- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
 *  @param notification 本地通知
 */

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    // NSLog(@"%@", notification.userInfo);
    // [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    // 跳转
    if (application.applicationState == UIApplicationStateInactive) {
        UILabel *label = [[UILabel alloc] init];
        label.backgroundColor = [UIColor redColor];
        label.frame = CGRectMake(0, 300, 300, 300);
        label.text = [NSString stringWithFormat:@"%@", notification];
        label.numberOfLines = 0;
        [self.window.rootViewController.view addSubview:label];
    }
}



- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return YES;
}


@end
