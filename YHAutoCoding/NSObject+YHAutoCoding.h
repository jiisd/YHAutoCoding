//
//  NSObject+YHAutoCoding.h
//  Demo
//
//  Created by 郑亚恒 on 15/8/25.
//  Copyright © 2015年 郑亚恒. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (YHAutoCoding)

/** 添加忽略归档的成员变量 */
- (NSArray *)ignoredMemberNames;
/** 归档方法 */
- (void)encode:(NSCoder *)encoder;
/** 解档方法 */
- (void)decode:(NSCoder *)decoder;

@end
