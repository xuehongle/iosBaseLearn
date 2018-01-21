//
//  AVPlayerViewViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/7/14.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "AVPlayerViewViewController.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

@interface AVPlayerViewViewController ()

@property (nonatomic, strong) AVPlayerViewController  *playerView;
@end

@implementation AVPlayerViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // MPMoviePlayerController 和 MPMoviePlayerViewController 过期了，所以是AVPlayerViewController
    NSURL * url = [NSURL URLWithString:@"https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"];
    self.playerView = [[AVPlayerViewController alloc]init];
    AVPlayer * player = [[AVPlayer alloc]initWithURL:url];
    self.playerView.player = player;
    
    /*
     可以设置的值及意义如下：
     AVLayerVideoGravityResizeAspect   不进行比例缩放 以宽高中长的一边充满为基准
     AVLayerVideoGravityResizeAspectFill 不进行比例缩放 以宽高中短的一边充满为基准
     AVLayerVideoGravityResize     进行缩放充满屏幕
     */
    self.playerView.videoGravity = AVLayerVideoGravityResizeAspect;
    

    UIButton * btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(30, 120, 100, 40);
    [btn setTitle:@"点击播放视频" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
}

- (void)btnClick {
    [self presentViewController:self.playerView animated:YES completion:nil];
}

@end
