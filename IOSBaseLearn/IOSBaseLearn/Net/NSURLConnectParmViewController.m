//
//  NSURLConnectParmViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/8/31.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "NSURLConnectParmViewController.h"

@interface NSURLConnectParmViewController ()

@end

@implementation NSURLConnectParmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
}

- (void)loadData {
    
    /**
     为什么不用NSData?
     NSData同步还是异步的->同步的
     默认时长是60s
     没有错误处理，因此不建议使用，在实际开发中，这个方法几乎不用！
     */
    //    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:nil]];
    //    UIImage *image = [UIImage imageWithData:data];
    
    // 1. url
    NSURL *url = [NSURL URLWithString:@"http://120.25.226.186:32812/login?username=520it&pwd=520it&type=JSON"];
    
    // 2. request
    /**
     参数
     2. cachePolicy(策略)
     NSURLRequestUseProtocolCachePolicy = 0,                        //默认的缓存策略
     NSURLRequestReload(刷新)Ignoring(忽略)Local(本地)CacheData = 1,  //忽略本地缓存数据，始终加载服务器的数据 针对的应用场景：对数据的及时性要求高的应用 例如：股票，彩票
     *** 以下两个选项，专门用来和"离线"访问
     *** 这两个选项应该和 Reachability 框架结合，如果没有联网，就使用本地缓存，可以给用户一个好的体验
     如果联网了，就使用默认的缓存策略，加载数据，并且缓存！
     NSURLRequestReturnCacheDataElseLoad = 2,        如果有缓存，就返回缓存，否则加载数据
     NSURLRequestReturnCacheDataDontLoad = 3,        如果有缓存，就返回缓存，否则不加载
     
     3. timeoutInterval 网络访问超时时长
     默认是 60 s，时间太长，建议超时时长，最好是15~30秒之间！不能太短
     － SDWebImage 的超时时长，15秒
     － AFN 的默认时长是 60 s
     */
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:15.0];
    //    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:0 timeoutInterval:15.0];
    
    // 3. connection － 所有的网络访问都要是异步的！
    /**
     方法本身就是异步提交网络请求获得网络数据的
     
     参数
     1. request 发送给服务器的请求
     2. queue   调度回调方法的队列，"回调方法本身"不耗时就用主队列，耗时就用异步队列
     － 主队列，回调方法在主线程执行
     － 自定义队列，回调方法在异步执行
     
     如果获得数据，直接更新UI，就可以选择主队列
     如果获得数据后，仍然需要做耗时的操作！
     * 下载一个 zip 包，需要解压缩，就可以选择自定义队列，在后台解压缩，然后再更新UI
     3. completionHandler 完成的回调
     3.1 response － NSHTTPURLResponse － 在 iOS 开发中，大多只有做下载的时候，才会和响应头打交道
     URL         反馈的 URL，有的时候，服务器会重定向新的 URL
     MIMEType    ContentType，内容的类型，是服务器告诉客户端，应该用什么软件处理这个二进制数据！
                            例子:Flash － 提示客户端安装 flash 插件
     
     *** 以下两个属性和下载有关
     *** expectedContentLength   数据(文件)的总长度
     *** suggestedFilename       建议的文件名
     
     statusCode  200成功，404页面不存在
     2XX成功，3XX重定向，4XX客户端错误，5XX服务器的错误
     allHeaderFields 所有响应头的字典
     
     3.2 data            － 程序员最关心的“数据实体”
     3.3 connectionError
     */
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        NSLog(@"%@", response);
        
        // 标准的错误处理方法
        if (connectionError || data == nil) {
            NSLog(@"你的网络不给力！");
            return;
        }
        
        NSLog(@"--> %@", [NSThread currentThread]);
        
        // 网络访问完成回调
        NSLog(@"%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    }];
    NSLog(@"come here");
}

@end
