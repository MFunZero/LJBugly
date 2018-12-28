//
//  LJCrashTool.h
//  LJCrash
//
//  Created by Jeffry on 2018/12/27.
//  Copyright © 2018年 Jeffry. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LJCrashTool : NSObject


+ (void)becomeEffective;

+ (void)exchangeClassMethod:(Class)anClass method1Sel:(SEL)method1Sel method2Sel:(SEL)method2Sel;

+ (void)exchangeInstanceMethod:(Class)anClass method1Sel:(SEL)method1Sel method2Sel:(SEL)method2Sel;

+ (void)errorWithException:(NSException *)exception;
@end

NS_ASSUME_NONNULL_END
