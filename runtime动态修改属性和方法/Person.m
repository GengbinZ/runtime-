//
//  Person.m
//  runtime动态修改属性和方法
//
//  Created by zgbin on 2017/8/21.
//  Copyright © 2017年 zgbin. All rights reserved.
//

#import "Person.h"

@interface Person()

@property(nonatomic, strong) NSString *address;
- (void)interface;

@end

@implementation Person

- (instancetype)init
{
    self = [super init];
    if (self) {
        _address = @"三里屯soho";
        self.name = @"Air";
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"address:%@, name:%@",self.address,self.name];
}

- (void)sayHello
{
    NSLog(@"hello, I'm at %@", self.address);
}

- (void)interface
{
    NSLog(@"I'm %@",self.name);
}

@end
