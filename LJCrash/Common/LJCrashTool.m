//
//  LJCrashTool.m
//  LJCrash
//
//  Created by Jeffry on 2018/12/27.
//  Copyright © 2018年 Jeffry. All rights reserved.
//

#import "LJCrashTool.h"
#import <objc/runtime.h>
#import "NSObject+Crash.h"
#import "NSString+Crash.h"
#import "NSMutableString+Crash.h"
#import "NSArray+Crash.h"
#import "NSMutableArray+Crash.h"
#import "NSDictionary+Crash.h"
#import "NSMutableDictionary+Crash.h"

@implementation LJCrashTool

+ (void)becomeEffective
{
    [NSObject LJCrashLoadMethod];
    [NSArray LJCrashLoadMethod];
    [NSMutableArray LJCrashLoadMethod];
    [NSDictionary LJCrashLoadMethod];
    [NSMutableDictionary LJCrashLoadMethod];
    [NSString LJCrashLoadMethod];
    [NSMutableString LJCrashLoadMethod];
}


+ (void)exchangeClassMethod:(Class)anClass method1Sel:(SEL)method1Sel method2Sel:(SEL)method2Sel {
    Method method1 = class_getClassMethod(anClass, method1Sel);
    Method method2 = class_getClassMethod(anClass, method2Sel);
    method_exchangeImplementations(method1, method2);
}


+ (void)exchangeInstanceMethod:(Class)anClass method1Sel:(SEL)method1Sel method2Sel:(SEL)method2Sel {
    
    
    Method originalMethod = class_getInstanceMethod(anClass, method1Sel);
    Method swizzledMethod = class_getInstanceMethod(anClass, method2Sel);
    
    BOOL didAddMethod =
    class_addMethod(anClass,
                    method1Sel,
                    method_getImplementation(swizzledMethod),
                    method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(anClass,
                            method2Sel,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    }
    
    else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
    
}

+ (void)errorWithException:(NSException *)exception
{
    
}

@end
