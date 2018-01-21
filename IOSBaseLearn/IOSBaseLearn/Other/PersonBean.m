//
//  PersonBean.m
//  IOSBaseLearn
//
//  Created by xue on 2017/7/27.
//  Copyright © 2017年 xue. All rights reserved.
//

#import "PersonBean.h"

@implementation PersonBean

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeInt:self.age forKey:@"age"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self.name = [aDecoder decodeObjectForKey:@"name"];
    self.age = [aDecoder decodeIntForKey:@"age"];
    return self;
}
@end
