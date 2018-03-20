//
//  Util.m
//  JHotelIOS
//
//  Created by 何苗 on 2018/3/20.
//  Copyright © 2018年 joehe. All rights reserved.
//
// 单例模式

#import "Util.h"

@interface Util () {
    CGFloat navigationBarHeight;
}

@end

@implementation Util

// 全局变量
static id _instance;

// 单例方法
+(instancetype)getInstance {
    return [[self alloc]init];
}
// 构造方法 初始化只执行一次
-(instancetype)init {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super init];
    });
    return _instance;
}

// 获取并储存导航栏高度，全局只需要设置一次
-(void)setNavigationBarHeight:(CGFloat)height {
    if (navigationBarHeight != 0.0) {
        @throw [NSException exceptionWithName:@"Util.setNavigationBarHeight" reason:@"已经设置过了" userInfo:nil];
    }
    navigationBarHeight = height;
}
// 获取顶部的安全高度
-(CGFloat)getSafeXHasNavigationBar:(BOOL)hasNavigationBar {
    if (hasNavigationBar) {
        if (navigationBarHeight == 0.0) {
            @throw [NSException exceptionWithName:@"Util.getSafeXHasNavigationBar" reason:@"请先调用Util.setNavigationBarHeight方法" userInfo:nil];
        }
        
        return J_statusBarHeight + navigationBarHeight;
    } else {
        return J_statusBarHeight;
    }
}

@end
