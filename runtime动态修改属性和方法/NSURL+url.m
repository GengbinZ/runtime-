//
//  NSURL+url.m
//  runtime动态修改属性和方法
//
//  Created by zgbin on 2017/8/21.
//  Copyright © 2017年 zgbin. All rights reserved.
//

#import "NSURL+url.h"
#import <objc/message.h>

@implementation NSURL (url)

//加载这个类的load方法
+(void)load{
    //class_getClassMethod : 获取类方法
    //class_getInstanceMethod : 获取对象方法
    
    //1.那到两个方法 苹果原来的URLWithString  和HK_URLWithString
    //2.1 类类型
    //2.2 方法编号
    
    Method mURLWithStr = class_getClassMethod([NSURL class], @selector(URLWithString:));
    Method mZG_URLWithStr = class_getClassMethod([NSURL class], @selector(ZG_URLWithString:));
    
    ////2.交换这两个方法!(你调用A 个么会执行 B )
    method_exchangeImplementations(mURLWithStr, mZG_URLWithStr);
}

+(instancetype)ZG_URLWithString:(NSString *)URLString
{
    NSURL *url = [NSURL ZG_URLWithString:URLString];
    if (url == nil) {
        NSLog(@"哥么是一个空的url");
    }
    return url;
}

@end
