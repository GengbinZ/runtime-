//
//  Person.h
//  runtime动态修改属性和方法
//
//  Created by zgbin on 2017/8/21.
//  Copyright © 2017年 zgbin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property(nonatomic, strong) NSString *name;
- (void)sayHello;

@end
