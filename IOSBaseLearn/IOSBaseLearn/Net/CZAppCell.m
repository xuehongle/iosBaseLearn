//
//  CZAppCell.m
//  IOSBaseLearn
//
//  Created by xue on 2017/8/28.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "CZAppCell.h"
#import "CZImageView.h"
#import "CZAppInfo.h"

@interface CZAppCell()

@property (weak, nonatomic) IBOutlet CZImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *downloadLabel;
@end

@implementation CZAppCell

- (void)setAppInfo:(CZAppInfo *)appInfo {
    _appInfo = appInfo;
    
    self.nameLabel.text = appInfo.name;
    self.downloadLabel.text = appInfo.download;
    
    // 直接让 cell 下载图像，并没有清空图像的动作！
    [self.iconView setImageWithURLString:appInfo.icon];
}

@end
