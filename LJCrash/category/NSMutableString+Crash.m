//
//  NSMutableString+Crash.m
//  LJCrash
//
//  Created by Jeffry on 2018/12/28.
//  Copyright © 2018年 Jeffry. All rights reserved.
//

#import "NSMutableString+Crash.h"
#import "LJCrashTool.h"

@implementation NSMutableString (Crash)

+ (void)LJCrashLoadMethod {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class stringClass = NSClassFromString(@"__NSCFString");
        
        //replaceCharactersInRange
        [LJCrashTool exchangeInstanceMethod:stringClass method1Sel:@selector(replaceCharactersInRange:withString:) method2Sel:@selector(crashReplaceCharactersInRange:withString:)];
        
        //insertString:atIndex:
        [LJCrashTool exchangeInstanceMethod:stringClass method1Sel:@selector(insertString:atIndex:) method2Sel:@selector(crashInsertString:atIndex:)];
        
        //deleteCharactersInRange
        [LJCrashTool exchangeInstanceMethod:stringClass method1Sel:@selector(deleteCharactersInRange:) method2Sel:@selector(crashDeleteCharactersInRange:)];
    });
}

#pragma mark - replaceCharactersInRange

- (void)crashReplaceCharactersInRange:(NSRange)range withString:(NSString *)aString {
    
    @try {
        [self crashReplaceCharactersInRange:range withString:aString];
    }
    @catch (NSException *exception) {
     
    }
    @finally {
        
    }
}


#pragma mark - insertString:atIndex:

- (void)crashInsertString:(NSString *)aString atIndex:(NSUInteger)loc {
    
    @try {
        [self crashInsertString:aString atIndex:loc];
    }
    @catch (NSException *exception) {
    
    }
    @finally {
        
    }
}


#pragma mark - deleteCharactersInRangec

- (void)crashDeleteCharactersInRange:(NSRange)range {
    
    @try {
        [self crashDeleteCharactersInRange:range];
    }
    @catch (NSException *exception) {
    
    }
    @finally {
        
    }
}


@end
