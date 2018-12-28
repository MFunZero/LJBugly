//
//  NSMutableDictionary+Crash.m
//  LJCrash
//
//  Created by Jeffry on 2018/12/28.
//  Copyright © 2018年 Jeffry. All rights reserved.
//

#import "NSMutableDictionary+Crash.h"

@implementation NSMutableDictionary (Crash)

+ (void)LJCrashLoadMethod {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class dictionaryM = NSClassFromString(@"__NSDictionaryM");
        
        //setObject:forKey:
        [LJCrashTool exchangeInstanceMethod:dictionaryM method1Sel:@selector(setObject:forKey:) method2Sel:@selector(crashSetObject:forKey:)];
        
        //setObject:forKeyedSubscript:
        if (KCrashIsiOS(11.0)) {
            [LJCrashTool exchangeInstanceMethod:dictionaryM method1Sel:@selector(setObject:forKeyedSubscript:) method2Sel:@selector(crashSetObject:forKeyedSubscript:)];
        }
        
        
        [LJCrashTool exchangeInstanceMethod:dictionaryM method1Sel:@selector(removeObjectForKey:) method2Sel:@selector(crashRemoveObjectForKey:)];

    });
}


#pragma mark - setObject:forKey:

- (void)crashSetObject:(id)anObject forKey:(id<NSCopying>)aKey {
    
    @try {
        [self crashSetObject:anObject forKey:aKey];
    }
    @catch (NSException *exception) {
    }
    @finally {
        
    }
}

#pragma mark - setObject:forKeyedSubscript:
- (void)crashSetObject:(id)obj forKeyedSubscript:(id<NSCopying>)key {
    @try {
        [self crashSetObject:obj forKeyedSubscript:key];
    }
    @catch (NSException *exception) {
    }
    @finally {
        
    }
}


#pragma mark - removeObjectForKey:

- (void)crashRemoveObjectForKey:(id)aKey {
    
    @try {
        [self crashRemoveObjectForKey:aKey];
    }
    @catch (NSException *exception) {
    }
    @finally {
        
    }
}


@end
