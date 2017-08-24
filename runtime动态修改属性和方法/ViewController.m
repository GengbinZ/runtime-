//
//  ViewController.m
//  runtime动态修改属性和方法
//
//  Created by zgbin on 2017/8/21.
//  Copyright © 2017年 zgbin. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "NSURL+url.h"
#import "PersonOne.h"
#import "Person+AddProperty.h"
#import <objc/message.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self addProperty];
    
}

//获取成员变量列表
- (void)getIvarList{
    Person *onePerson = [[Person alloc] init];
    NSLog(@"first time:%@",[onePerson description]);
    
    unsigned int count = 0;
    Ivar *members = class_copyIvarList([Person class], &count);
    for (int i = 0; i < count; i++) {
        Ivar var = members[i];
        const char *memberAddress = ivar_getName(var);
        const char *memberType = ivar_getTypeEncoding(var);
        NSLog(@"address = %s; type = %s", memberAddress,memberType);
    }
    
    //对私有变量的更改
    Ivar m_address = members[1];
    NSLog(@"m_address = %s", ivar_getName(m_address));
    object_setIvar(onePerson, m_address, @"朝阳公园");
    NSLog(@"second time : %@",[onePerson description]);
}

//获取属性列表
- (void)getPropertyList{
    unsigned int count;
    objc_property_t *propertyList = class_copyPropertyList([Person class], &count);
    for (unsigned int i = 0; i < count; i++) {
        const char *propertyName = property_getName(propertyList[i]);
        NSLog(@"property---->%@", [NSString stringWithUTF8String:propertyName]);
    }
}

//获取方法列表
- (void)getMethodList{
    unsigned int count = 0;
    Method *memberFuns = class_copyMethodList([Person class], &count);
    for (int i = 0; i < count; i++) {
        SEL address = method_getName(memberFuns[i]);
        NSString *methodName = [NSString stringWithCString:sel_getName(address) encoding:NSUTF8StringEncoding];
        NSLog(@"member method:%@",methodName);
    }
}

//获取协议列表
- (void)getProtocolList{
    unsigned int count = 0;
    __unsafe_unretained Protocol **protocolList = class_copyProtocolList([self class], &count);
    for (unsigned int i = 0; i<count; i++) {
        Protocol *myProtocal = protocolList[i];
        const char *protocolName = protocol_getName(myProtocal);
        NSLog(@"protocol---->%@", [NSString stringWithUTF8String:protocolName]);
    }
}

//交换方法
- (void)exchangeMethod{
    //创建RUL 如此的简单!! But!!!
    //如果字符串有中文,这个url就创建不成功!那么我们发送请求就会出错!!
    //OC中没有url为空的检测机制!!Swift里面有可选项!
    //我需要给URLWithString 添加一个检测是否为空的功能!!
    NSURL * url = [NSURL URLWithString:@"www.baidu.com/中文"];
    NSLog(@"%@",url);
}

//方法的懒加载：外部隐式调用一个不存在的方法，即动态添加方法
- (void)addMethod{
    PersonOne *p = [[PersonOne alloc] init];
    [p performSelector:@selector(eat)];
    [p performSelector:@selector(eat:) withObject:@"鸡腿堡"];
}

//添加属性
- (void)addProperty{
    Person *p = [[Person alloc] init];
    p.secondName = @"动态添加属性";
    NSLog(@"%@", p.secondName);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
