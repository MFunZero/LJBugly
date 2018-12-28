//
//  LJBugly.m
//  LJCrash
//
//  Created by Jeffry on 2018/12/28.
//  Copyright © 2018年 Jeffry. All rights reserved.
//

#import "LJBugly.h"
#import "LJCrashTool.h"

@implementation LJBugly

+ (void)openBugly
{
    [LJCrashTool  becomeEffective];
}

@end
