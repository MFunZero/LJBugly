//
//  NSArray+Crash.m
//  LJCrash
//
//  Created by Jeffry on 2018/12/28.
//  Copyright © 2018年 Jeffry. All rights reserved.
//

#import "NSArray+Crash.h"
#import "LJCrashTool.h"

@implementation NSArray (Crash)

+ (void)LJCrashLoadMethod {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //=================
        //   class method
        //=================
        
        //instance array method exchange
        [LJCrashTool exchangeClassMethod:[self class] method1Sel:@selector(arrayWithObjects:count:) method2Sel:@selector(crashArrayWithObjects:count:)];
        
        
        
        //====================
        //   instance method
        //====================
        
        Class __NSArray = NSClassFromString(@"NSArray");
        Class __NSArrayI = NSClassFromString(@"__NSArrayI");
        Class __NSSingleObjectArrayI = NSClassFromString(@"__NSSingleObjectArrayI");
        Class __NSArray0 = NSClassFromString(@"__NSArray0");
        
        
        //objectsAtIndexes:
        [LJCrashTool exchangeInstanceMethod:__NSArray method1Sel:@selector(objectsAtIndexes:) method2Sel:@selector(crashObjectsAtIndexes:)];
        
        
        //objectAtIndex:
        
        [LJCrashTool exchangeInstanceMethod:__NSArrayI method1Sel:@selector(objectAtIndex:) method2Sel:@selector(__NSArrayIcrashObjectAtIndex:)];
        
        [LJCrashTool exchangeInstanceMethod:__NSSingleObjectArrayI method1Sel:@selector(objectAtIndex:) method2Sel:@selector(__NSSingleObjectArrayIcrashObjectAtIndex:)];
        
        [LJCrashTool exchangeInstanceMethod:__NSArray0 method1Sel:@selector(objectAtIndex:) method2Sel:@selector(__NSArray0crashObjectAtIndex:)];
        
        //objectAtIndexedSubscript:
        if (KCrashIsiOS(11.0)) {
            [LJCrashTool exchangeInstanceMethod:__NSArrayI method1Sel:@selector(objectAtIndexedSubscript:) method2Sel:@selector(__NSArrayIcrashObjectAtIndexedSubscript:)];
        }
        
        
        //getObjects:range:
        [LJCrashTool exchangeInstanceMethod:__NSArray method1Sel:@selector(getObjects:range:) method2Sel:@selector(NSArraycrashGetObjects:range:)];
        
        [LJCrashTool exchangeInstanceMethod:__NSSingleObjectArrayI method1Sel:@selector(getObjects:range:) method2Sel:@selector(__NSSingleObjectArrayIcrashGetObjects:range:)];
        
        [LJCrashTool exchangeInstanceMethod:__NSArrayI method1Sel:@selector(getObjects:range:) method2Sel:@selector(__NSArrayIcrashGetObjects:range:)];
    });
}


#pragma mark - instance array


+ (instancetype)crashArrayWithObjects:(const id  _Nonnull __unsafe_unretained *)objects count:(NSUInteger)cnt {
    
    id instance = nil;
    
    @try {
        instance = [self crashArrayWithObjects:objects count:cnt];
    }
    @catch (NSException *exception) {
        
        //以下是对错误数据的处理，把为nil的数据去掉,然后初始化数组
        NSInteger newObjsIndex = 0;
        id  _Nonnull __unsafe_unretained newObjects[cnt];
        
        for (int i = 0; i < cnt; i++) {
            if (objects[i] != nil) {
                newObjects[newObjsIndex] = objects[i];
                newObjsIndex++;
            }
        }
        instance = [self crashArrayWithObjects:newObjects count:newObjsIndex];
    }
    @finally {
        return instance;
    }
}


#pragma mark - objectAtIndexedSubscript:
- (id)__NSArrayIcrashObjectAtIndexedSubscript:(NSUInteger)idx {
    id object = nil;
    
    @try {
        object = [self __NSArrayIcrashObjectAtIndexedSubscript:idx];
    }
    @catch (NSException *exception) {
 
    }
    @finally {
        return object;
    }
    
}

#pragma mark - objectsAtIndexes:

- (NSArray *)crashObjectsAtIndexes:(NSIndexSet *)indexes {
    
    NSArray *returnArray = nil;
    @try {
        returnArray = [self crashObjectsAtIndexes:indexes];
    } @catch (NSException *exception) {
        
    } @finally {
        return returnArray;
    }
}


#pragma mark - objectAtIndex:

//__NSArrayI  objectAtIndex:
- (id)__NSArrayIcrashObjectAtIndex:(NSUInteger)index {
    id object = nil;
    
    @try {
        object = [self __NSArrayIcrashObjectAtIndex:index];
    }
    @catch (NSException *exception) {
    }
    @finally {
        return object;
    }
}



//__NSSingleObjectArrayI objectAtIndex:
- (id)__NSSingleObjectArrayIcrashObjectAtIndex:(NSUInteger)index {
    id object = nil;
    
    @try {
        object = [self __NSSingleObjectArrayIcrashObjectAtIndex:index];
    }
    @catch (NSException *exception) {
    }
    @finally {
        return object;
    }
}

//__NSArray0 objectAtIndex:
- (id)__NSArray0crashObjectAtIndex:(NSUInteger)index {
    id object = nil;
    
    @try {
        object = [self __NSArray0crashObjectAtIndex:index];
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        return object;
    }
}


#pragma mark - getObjects:range:

//NSArray getObjects:range:
- (void)NSArraycrashGetObjects:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range {
    
    @try {
        [self NSArraycrashGetObjects:objects range:range];
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}


//__NSSingleObjectArrayI  getObjects:range:
- (void)__NSSingleObjectArrayIcrashGetObjects:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range {
    
    @try {
        [self __NSSingleObjectArrayIcrashGetObjects:objects range:range];
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}


//__NSArrayI  getObjects:range:
- (void)__NSArrayIcrashGetObjects:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range {
    
    @try {
        [self __NSArrayIcrashGetObjects:objects range:range];
    } @catch (NSException *exception) {
        
        
    } @finally {
        
    }
}

@end
