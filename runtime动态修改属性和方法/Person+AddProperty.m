//
//  Person+AddProperty.m
//  runtime动态修改属性和方法
//
//  Created by zgbin on 2017/8/22.
//  Copyright © 2017年 zgbin. All rights reserved.
//

#import "Person+AddProperty.h"
#import <objc/message.h>

static char *PersonNameKey = "PersonNameKey";

@implementation Person (AddProperty)

- (void)setSecondName:(NSString *)secondName{
    /*
     OBJC_ASSOCIATION_ASSIGN;            //assign策略
     OBJC_ASSOCIATION_COPY_NONATOMIC;    //copy策略
     OBJC_ASSOCIATION_RETAIN_NONATOMIC;  // retain策略
     
     OBJC_ASSOCIATION_RETAIN;
     OBJC_ASSOCIATION_COPY;
     */
    /*
     * id object 给哪个对象的属性赋值
     const void *key 属性对应的key
     id value  设置属性值为value
     objc_AssociationPolicy policy  使用的策略，是一个枚举值，和copy，retain，assign是一样的，手机开发一般都选择NONATOMIC
     objc_setAssociatedObject(id object, const void *key, id value, objc_AssociationPolicy policy);
     */
    
    objc_setAssociatedObject(self, PersonNameKey, secondName, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
}

-(NSString *)secondName{
    return objc_getAssociatedObject(self, PersonNameKey);
}

@end
