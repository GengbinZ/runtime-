//
//  PersonOne.m
//  runtime动态修改属性和方法
//
//  Created by zgbin on 2017/8/21.
//  Copyright © 2017年 zgbin. All rights reserved.
//

#import "PersonOne.h"
#import <objc/message.h>

@implementation PersonOne

//所有的C语言的函数里面!都有这两个隐式参数!只要调用,哥么系统都会传递进来!
void eat(id self, SEL _cmd){
    NSLog(@"调用了%@对象的%@方法",self,NSStringFromSelector(_cmd));
}

void eat1(id self, SEL _cmd, id obj){
    NSLog(@"哥么今晚吃4个%@",obj);
}

//当这个类被调用了没有实现的方法就会来到这里
+(BOOL)resolveInstanceMethod:(SEL)sel{
    //    NSLog(@"你没有实现这个方法%@",NSStringFromSelector(sel));
    if (sel == @selector(eat)) {
        /*
         1.cls: 类类型
         2.name: 方法编号
         3.imp: 方法实现,函数指针!
         4.types:函数类型 C字符串(代码) void === "v"
         */
        class_addMethod([PersonOne class],sel, (IMP)eat, "v@:");
    }else if (sel == @selector(eat:)){
        class_addMethod([PersonOne class], sel, (IMP)eat1, "v@:@");
    }
    return [super resolveInstanceMethod:sel];
}

@end
