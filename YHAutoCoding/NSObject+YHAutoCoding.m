//
//  NSObject+YHAutoCoding.m
//  Demo
//
//  Created by 郑亚恒 on 15/8/25.
//  Copyright © 2015年 郑亚恒. All rights reserved.
//

#import "NSObject+YHAutoCoding.h"
#import <objc/runtime.h>

@implementation NSObject (YHAutoCoding)

- (void)encode:(NSCoder *)encoder
{
    Class c = self.class;
    
    while (c && c != [NSObject class]) {
        
        unsigned int memberCount = 0;
        
        Ivar *ivars = class_copyIvarList(c, &memberCount);
        
        for (int i = 0; i<memberCount; i++) {
            
            Ivar ivar = ivars[i];
            
            NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
            
            if ([self respondsToSelector:@selector(ignoredMemberNames)]) {
                if ([[self ignoredMemberNames] containsObject:key]) continue;
            }
            
            id value = [self valueForKeyPath:key];
            
            [encoder encodeObject:value forKey:key];
        }
        
        free(ivars);
        
        c = [c superclass];
    }
}

- (void)decode:(NSCoder *)decoder
{
    Class c = self.class;
    
    while (c && c != [NSObject class]) {

        unsigned int memberCount = 0;
        
        Ivar *ivars = class_copyIvarList(c, &memberCount);
        
        for (int i = 0; i<memberCount; i++) {
            
            Ivar ivar = ivars[i];
            
            NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
            
            if ([self respondsToSelector:@selector(ignoredMemberNames)]) {
                if ([[self ignoredMemberNames] containsObject:key]) continue;
            }
            
            id value = [decoder decodeObjectForKey:key];
            
            [self setValue:value forKeyPath:key];
        }
        
        free(ivars);
        
        c = [c superclass];
    }
}

-(NSArray *)ignoredMemberNames {
    
    return nil;
}
@end
