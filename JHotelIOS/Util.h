//
//  Util.h
//  JHotelIOS
//
//  Created by 何苗 on 2018/3/20.
//  Copyright © 2018年 joehe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

/**
 * Size
 * J_w               屏幕宽度
 * J_h               屏幕高度
 * J_statusBarHeight 状态栏高度 一般为20 iPhoneX为44
 */
#define J_w [UIScreen mainScreen].bounds.size.width
#define J_h [UIScreen mainScreen].bounds.size.height
#define J_statusBarHeight [[UIApplication sharedApplication]statusBarFrame].size.height

/**
 * Color
 * J_colorMain 主色
 */
#define J_colorMain [UIColor colorWithRed:63/255.0 green:81/255.0 blue:180/255.0 alpha:1.0]
#define J_colorGray [UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1.0]

/**
 * Font_size
 */
#define J_fontNav [UIFont systemFontOfSize:17]
#define J_fontBig [UIFont systemFontOfSize:16]
#define J_fontNormal [UIFont systemFontOfSize:14]
#define J_fontSmall [UIFont systemFontOfSize:12]

@interface Util : UIViewController

/**
 * 单例模式
 */
+(instancetype)getInstance;

-(AppDelegate *)getApp;

/**
 * 获取并储存导航栏高度，全局只需要设置一次
 */
-(void)setNavigationBarHeight:(CGFloat)height;
-(CGFloat)getNavigationBarHeight;
/**
 * 获取顶部的安全高度
 */
-(CGFloat)getSafeYHasNavigationBar:(BOOL)hasNavigationBar;

@end
