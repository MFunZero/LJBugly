//
//  NSDictionary+Crash.m
//  LJCrash
//
//  Created by Jeffry on 2018/12/28.
//  Copyright © 2018年 Jeffry. All rights reserved.
//

#import "NSDictionary+Crash.h"

@implementation NSDictionary (Crash)



+ (void)LJCrashLoadMethod {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [LJCrashTool exchangeClassMethod:self method1Sel:@selector(dictionaryWithObjects:forKeys:count:) method2Sel:@selector(crashDictionaryWithObjects:forKeys:count:)];
    });
}

+ (instancetype)crashDictionaryWithObjects:(const id  _Nonnull __unsafe_unretained *)objects forKeys:(const id<NSCopying>  _Nonnull __unsafe_unretained *)keys count:(NSUInteger)cnt {
    
    id instance = nil;
    
    @try {
        instance = [self crashDictionaryWithObjects:objects forKeys:keys count:cnt];
    }
    @catch (NSException *exception) {
        
        //处理错误的数据，然后重新初始化一个字典
        NSUInteger index = 0;
        id  _Nonnull __unsafe_unretained newObjects[cnt];
        id  _Nonnull __unsafe_unretained newkeys[cnt];
        
        for (int i = 0; i < cnt; i++) {
            if (objects[i] && keys[i]) {
                newObjects[index] = objects[i];
                newkeys[index] = keys[i];
                index++;
            }
        }
        instance = [self crashDictionaryWithObjects:newObjects forKeys:newkeys count:index];
    }
    @finally {
        return instance;
    }
}


@end
