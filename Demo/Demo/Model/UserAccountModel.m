//
//  UserAccountModel.m
//  Demo
//
//  Created by 郑亚恒 on 15/8/25.
//  Copyright © 2015年 郑亚恒. All rights reserved.
//

#import <objc/runtime.h>
#import "UserAccountModel.h"


@implementation UserAccountModel

/** 一句话实现对象自动归档解档 */
yh_autoCoding

/** 添加忽略归档的变量 */
- (NSArray *)ignoredMemberNames {
    return @[@"_zs_balance"];
}

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    
    return self;
}

+ (instancetype)accountModelWithDict:(NSDictionary *)dict {
    
    return  [[self alloc]initWithDict:dict];
}

/** 重写描述方法 */
- (NSString *)description {
    
    unsigned int memberCount = 0;
    NSMutableString *strM = [[NSMutableString alloc]init];
    Ivar *ivars = class_copyIvarList([self class], &memberCount);
    
    for (int i = 0; i<memberCount; i++) {
        
        Ivar ivar = ivars[i];
        NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
        id value = [self valueForKeyPath:key];
        NSString *str = [NSString stringWithFormat:@"\n%@-%@",key,value];
        
        [strM appendString:str];
    }
    
    return strM;
}

- (void)setValue:(nullable id)value forUndefinedKey:(nonnull NSString *)key {}

@end
