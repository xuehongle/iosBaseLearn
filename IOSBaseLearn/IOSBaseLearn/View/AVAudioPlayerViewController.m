//
//  AVAudioPlayerViewController.m
//  IOSBaseLearn
//
//  Created by xue on 2017/7/14.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "AVAudioPlayerViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface AVAudioPlayerViewController () <AVAudioPlayerDelegate>

@property (nonatomic, strong) AVAudioPlayer * player;
@property (nonatomic, strong) UIProgressView * progressView;
@property (nonatomic, strong) NSTimer * timer;
@end

@implementation AVAudioPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton * btnPlay = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnPlay.frame = CGRectMake(20, 70, 100, 40);
    [btnPlay setTitle:@"播放" forState:UIControlStateNormal];
    [btnPlay addTarget:self action:@selector(play) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnPlay];
    
    UIButton * btnPause = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnPause.frame = CGRectMake(20, 120, 100, 40);
    [btnPause setTitle:@"暂停" forState:UIControlStateNormal];
    [btnPause addTarget:self action:@selector(pause) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnPause];
    
    UIButton * btnStop = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnStop.frame = CGRectMake(20, 170, 100, 40);
    [btnStop setTitle:@"停止" forState:UIControlStateNormal];
    [btnStop addTarget:self action:@selector(stop) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnStop];
    
    _progressView = [[UIProgressView alloc]init];
    _progressView.frame = CGRectMake(10, 220, 300, 30);
    _progressView.progress = 0;
    [self.view addSubview:_progressView];
    
    NSString * str = [[NSBundle mainBundle] pathForResource:@"001" ofType:@"mp3"];
    NSURL * url = [NSURL fileURLWithPath:str];
    self.player = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
    [self.player prepareToPlay];
    self.player.numberOfLoops = 0; // -1无限循环的
    self.player.volume = 0.5;
    self.player.delegate = self;
}

- (void) play {
    [self.player play];
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        _progressView.progress = self.player.currentTime / self.player.duration;
    }];
}

- (void) pause {
    [self.player pause];
}

- (void) stop {
    [self.player stop];
    self.player.currentTime = 0;
}

#pragma mark: - delegate
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    [self.timer invalidate];
}

@end
