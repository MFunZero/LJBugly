//
//  NSMutableArray+Crash.m
//  LJCrash
//
//  Created by Jeffry on 2018/12/28.
//  Copyright © 2018年 Jeffry. All rights reserved.
//

#import "NSMutableArray+Crash.h"


@implementation NSMutableArray (Crash)

#pragma mark - get object from array

+ (void)LJCrashLoadMethod {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class arrayMClass = NSClassFromString(@"__NSArrayM");
        
        
        //objectAtIndex:
        [LJCrashTool exchangeInstanceMethod:arrayMClass method1Sel:@selector(objectAtIndex:) method2Sel:@selector(crashObjectAtIndex:)];
        
        //objectAtIndexedSubscript
        if (KCrashIsiOS(11.0)) {
            [LJCrashTool exchangeInstanceMethod:arrayMClass method1Sel:@selector(objectAtIndexedSubscript:) method2Sel:@selector(crashObjectAtIndexedSubscript:)];
        }
        
        
        //setObject:atIndexedSubscript:
        [LJCrashTool exchangeInstanceMethod:arrayMClass method1Sel:@selector(setObject:atIndexedSubscript:) method2Sel:@selector(crashSetObject:atIndexedSubscript:)];
        
        
        //removeObjectAtIndex:
        [LJCrashTool exchangeInstanceMethod:arrayMClass method1Sel:@selector(removeObjectAtIndex:) method2Sel:@selector(crashRemoveObjectAtIndex:)];
        
        //insertObject:atIndex:
        [LJCrashTool exchangeInstanceMethod:arrayMClass method1Sel:@selector(insertObject:atIndex:) method2Sel:@selector(crashInsertObject:atIndex:)];
        
        //getObjects:range:
        [LJCrashTool exchangeInstanceMethod:arrayMClass method1Sel:@selector(getObjects:range:) method2Sel:@selector(crashGetObjects:range:)];
    });
    
}

- (void)crashSetObject:(id)obj atIndexedSubscript:(NSUInteger)idx {
    
    @try {
        [self crashSetObject:obj atIndexedSubscript:idx];
    }
    @catch (NSException *exception) {
    }
    @finally {
        
    }
}


//=================================================================
//                    removeObjectAtIndex:
//=================================================================
#pragma mark - removeObjectAtIndex:

- (void)crashRemoveObjectAtIndex:(NSUInteger)index {
    @try {
        [self crashRemoveObjectAtIndex:index];
    }
    @catch (NSException *exception) {
    }
    @finally {
        
    }
}


//=================================================================
//                    insertObject:atIndex:
//=================================================================
#pragma mark - set方法
- (void)crashInsertObject:(id)anObject atIndex:(NSUInteger)index {
    @try {
        [self crashInsertObject:anObject atIndex:index];
    }
    @catch (NSException *exception) {
    }
    @finally {
        
    }
}


//=================================================================
//                           objectAtIndex:
//=================================================================
#pragma mark - objectAtIndex:

- (id)crashObjectAtIndex:(NSUInteger)index {
    id object = nil;
    
    @try {
        object = [self crashObjectAtIndex:index];
    }
    @catch (NSException *exception) {
    }
    @finally {
        return object;
    }
}

//=================================================================
//                     objectAtIndexedSubscript:
//=================================================================
#pragma mark - objectAtIndexedSubscript:
- (id)crashObjectAtIndexedSubscript:(NSUInteger)idx {
    id object = nil;
    
    @try {
        object = [self crashObjectAtIndexedSubscript:idx];
    }
    @catch (NSException *exception) {
    }
    @finally {
        return object;
    }
    
}


//=================================================================
//                         getObjects:range:
//=================================================================
#pragma mark - getObjects:range:

- (void)crashGetObjects:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range {
    
    @try {
        [self crashGetObjects:objects range:range];
    } @catch (NSException *exception) {
        
        
    } @finally {
        
    }
}




@end
