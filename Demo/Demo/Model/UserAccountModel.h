//
//  UserAccountModel.h
//  Demo
//
//  Created by 郑亚恒 on 15/8/25.
//  Copyright © 2015年 郑亚恒. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YHAutoCoding.h"

@interface UserAccountModel : NSObject

@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *zx_balance;
@property (nonatomic, copy) NSString *zs_balance;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)accountModelWithDict:(NSDictionary *)dict;
@end
