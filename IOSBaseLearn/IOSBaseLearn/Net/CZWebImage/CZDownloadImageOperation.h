//
//  CZDownloadImageOperation.h
//  02-自定义NSOpeation(掌握)
//
//  Created by teacher on 15-2-2.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CZDownloadImageOperation : NSOperation

+ (instancetype)downloadImageOpeartionWithURLString:(NSString *)urlString successed:(void (^) (UIImage *image))successed;

@end
