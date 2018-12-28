//
//  NSObject+Crash.m
//  LJCrash
//
//  Created by Jeffry on 2018/12/27.
//  Copyright © 2018年 Jeffry. All rights reserved.
//

#import "NSObject+Crash.h"
#import "LJCrashProxy.h"
#import "LJCrashTool.h"

@implementation NSObject (Crash)


+ (void)LJCrashLoadMethod{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //setValue:forKey:
        [LJCrashTool exchangeInstanceMethod:[self class] method1Sel:@selector(setValue:forKey:) method2Sel:@selector(crashSetValue:forKey:)];
        
        //setValue:forKeyPath:
        [LJCrashTool exchangeInstanceMethod:[self class] method1Sel:@selector(setValue:forKeyPath:) method2Sel:@selector(crashSetValue:forKeyPath:)];
        
        //setValue:forUndefinedKey:
        [LJCrashTool exchangeInstanceMethod:[self class] method1Sel:@selector(setValue:forUndefinedKey:) method2Sel:@selector(crashSetValue:forUndefinedKey:)];
        
        //setValuesForKeysWithDictionary:
        [LJCrashTool exchangeInstanceMethod:[self class] method1Sel:@selector(setValuesForKeysWithDictionary:) method2Sel:@selector(crashSetValuesForKeysWithDictionary:)];
        
        
        //unrecognized selector sent to instance
            [LJCrashTool exchangeInstanceMethod:[self class] method1Sel:@selector(methodSignatureForSelector:) method2Sel:@selector(crashMethodSignatureForSelector:)];
            [LJCrashTool exchangeInstanceMethod:[self class] method1Sel:@selector(forwardInvocation:) method2Sel:@selector(crashForwardInvocation:)];
    });
}


- (NSMethodSignature *)crashMethodSignatureForSelector:(SEL)aSelector
{
    NSMethodSignature *ms = [self crashMethodSignatureForSelector:aSelector];
    BOOL flag = NO;
    if (ms == nil) {
        NSString *classStr = NSStringFromClass([self class]);
        if (!([classStr hasPrefix:@"UI"] || [classStr hasPrefix:@"NS"])) {
            ms = [LJCrashProxy instanceMethodSignatureForSelector:@selector(proxyMethod)];
            flag = YES;
        }else{
            ms = [LJCrashProxy instanceMethodSignatureForSelector:@selector(proxyMethod)];
        }
    }
    return ms;
}


- (void)crashForwardInvocation:(NSInvocation *)anInvocation {
    
    @try {
        [self crashForwardInvocation:anInvocation];
        
    } @catch (NSException *exception) {
        
        
    } @finally {
        
    }
    
}

#pragma mark - setValue:forKey:

- (void)crashSetValue:(id)value forKey:(NSString *)key {
    @try {
        [self crashSetValue:value forKey:key];
    }
    @catch (NSException *exception) {
       
    }
    @finally {
        
    }
}

#pragma mark - setValue:forKeyPath:

- (void)crashSetValue:(id)value forKeyPath:(NSString *)keyPath {
    @try {
        [self crashSetValue:value forKeyPath:keyPath];
    }
    @catch (NSException *exception) {
       
    }
    @finally {
        
    }
}

#pragma mark - setValue:forUndefinedKey:

- (void)crashSetValue:(id)value forUndefinedKey:(NSString *)key {
    @try {
        [self crashSetValue:value forUndefinedKey:key];
    }
    @catch (NSException *exception) {
       
    }
    @finally {
        
    }
}


#pragma mark - setValuesForKeysWithDictionary:

- (void)crashSetValuesForKeysWithDictionary:(NSDictionary<NSString *,id> *)keyedValues {
    @try {
        [self crashSetValuesForKeysWithDictionary:keyedValues];
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        
    }
}


@end
