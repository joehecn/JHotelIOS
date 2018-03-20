//
//  Util.h
//  JHotelIOS
//
//  Created by 何苗 on 2018/3/20.
//  Copyright © 2018年 joehe. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * J_w               屏幕宽度
 * J_h               屏幕高度
 * J_statusBarHeight 状态栏高度 一般为20 iPhoneX为44
 */

#define J_w [UIScreen mainScreen].bounds.size.width
#define J_h [UIScreen mainScreen].bounds.size.height
#define J_statusBarHeight [[UIApplication sharedApplication]statusBarFrame].size.height

/**
 * J_colorMain 主色
 */
#define J_colorMain [UIColor colorWithRed:0.16 green:0.72 blue:0.55 alpha:1.0]

@interface Util : UIViewController

/**
 * 单例模式
 */
+(instancetype)getInstance;

/**
 * 获取并储存导航栏高度，全局只需要设置一次
 */
-(void)setNavigationBarHeight:(CGFloat)height;
/**
 * 获取顶部的安全高度
 */
-(CGFloat)getSafeXHasNavigationBar:(BOOL)hasNavigationBar;

@end
