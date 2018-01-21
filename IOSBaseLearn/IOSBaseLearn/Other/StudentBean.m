//
//  StudentBean.m
//  IOSBaseLearn
//
//  Created by xue on 2017/7/27.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "StudentBean.h"

@implementation StudentBean

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [super encodeWithCoder:aCoder];
    [aCoder encodeFloat:self.height forKey:@"height"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.height = [aDecoder decodeFloatForKey:@"height"];
    }
    return self;
}
@end
