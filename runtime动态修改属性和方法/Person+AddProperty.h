//
//  Person+AddProperty.h
//  runtime动态修改属性和方法
//
//  Created by zgbin on 2017/8/22.
//  Copyright © 2017年 zgbin. All rights reserved.
//

#import "Person.h"

@interface Person (AddProperty)
@property(copy, nonatomic) NSString *secondName;
@end
