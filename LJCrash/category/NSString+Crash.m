//
//  NSString+Crash.m
//  LJCrash
//
//  Created by Jeffry on 2018/12/28.
//  Copyright © 2018年 Jeffry. All rights reserved.
//

#import "NSString+Crash.h"
#import "LJCrashTool.h"

@implementation NSString (Crash)

+ (void)LJCrashLoadMethod {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class stringClass = NSClassFromString(@"__NSCFConstantString");
        
        //characterAtIndex
        [LJCrashTool exchangeInstanceMethod:stringClass method1Sel:@selector(characterAtIndex:) method2Sel:@selector(crashCharacterAtIndex:)];
        
        //substringFromIndex
        [LJCrashTool exchangeInstanceMethod:stringClass method1Sel:@selector(substringFromIndex:) method2Sel:@selector(crashSubstringFromIndex:)];
        
        //substringToIndex
        [LJCrashTool exchangeInstanceMethod:stringClass method1Sel:@selector(substringToIndex:) method2Sel:@selector(crashSubstringToIndex:)];
        
        //substringWithRange:
        [LJCrashTool exchangeInstanceMethod:stringClass method1Sel:@selector(substringWithRange:) method2Sel:@selector(crashSubstringWithRange:)];
        
        //stringByReplacingOccurrencesOfString:
        [LJCrashTool exchangeInstanceMethod:stringClass method1Sel:@selector(stringByReplacingOccurrencesOfString:withString:) method2Sel:@selector(crashStringByReplacingOccurrencesOfString:withString:)];
        
        //stringByReplacingOccurrencesOfString:withString:options:range:
        [LJCrashTool exchangeInstanceMethod:stringClass method1Sel:@selector(stringByReplacingOccurrencesOfString:withString:options:range:) method2Sel:@selector(crashStringByReplacingOccurrencesOfString:withString:options:range:)];
        
        //stringByReplacingCharactersInRange:withString:
        [LJCrashTool exchangeInstanceMethod:stringClass method1Sel:@selector(stringByReplacingCharactersInRange:withString:) method2Sel:@selector(crashStringByReplacingCharactersInRange:withString:)];
    });
}

#pragma mark - characterAtIndex:

- (unichar)crashCharacterAtIndex:(NSUInteger)index {
    
    unichar characteristic;
    @try {
        characteristic = [self crashCharacterAtIndex:index];
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        return characteristic;
    }
}

#pragma mark - substringFromIndex:

- (NSString *)crashSubstringFromIndex:(NSUInteger)from {
    
    NSString *subString = nil;
    
    @try {
        subString = [self crashSubstringFromIndex:from];
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        return subString;
    }
}


#pragma mark - substringToIndex

- (NSString *)crashSubstringToIndex:(NSUInteger)to {
    
    NSString *subString = nil;
    
    @try {
        subString = [self crashSubstringToIndex:to];
    }
    @catch (NSException *exception) {
        subString = nil;
    }
    @finally {
        return subString;
    }
}


#pragma mark - substringWithRange:

- (NSString *)crashSubstringWithRange:(NSRange)range {
    
    NSString *subString = nil;
    
    @try {
        subString = [self crashSubstringWithRange:range];
    }
    @catch (NSException *exception) {
        subString = nil;
    }
    @finally {
        return subString;
    }
}


#pragma mark - stringByReplacingOccurrencesOfString:

- (NSString *)crashStringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement {
    
    NSString *newStr = nil;
    
    @try {
        newStr = [self crashStringByReplacingOccurrencesOfString:target withString:replacement];
    }
    @catch (NSException *exception) {
        newStr = nil;
    }
    @finally {
        return newStr;
    }
}


#pragma mark - stringByReplacingOccurrencesOfString:withString:options:range:

- (NSString *)crashStringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement options:(NSStringCompareOptions)options range:(NSRange)searchRange {
    
    NSString *newStr = nil;
    
    @try {
        newStr = [self crashStringByReplacingOccurrencesOfString:target withString:replacement options:options range:searchRange];
    }
    @catch (NSException *exception) {
        newStr = nil;
    }
    @finally {
        return newStr;
    }
}


#pragma mark - stringByReplacingCharactersInRange:withString:

- (NSString *)crashStringByReplacingCharactersInRange:(NSRange)range withString:(NSString *)replacement {
    
    
    NSString *newStr = nil;
    
    @try {
        newStr = [self crashStringByReplacingCharactersInRange:range withString:replacement];
    }
    @catch (NSException *exception) {
        newStr = nil;
    }
    @finally {
        return newStr;
    }
}


@end
