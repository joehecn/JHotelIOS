//
//  main.m
//  JHotelIOS
//
//  Created by 何苗 on 2018/3/20.
//  Copyright © 2018年 joehe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

/**
 * 应用启动过程
 * - 入口 main 函数
 * - @autoreleasepool 创建自动释放池
 * - 执行 UIApplicationMain 永远不会返回，保证程序不会被销毁
 * - 第三个参数 nil 相当于应用程序类字符串 @"UIApplication" 创建一个应用程序对象
 * - 第四个参数：创建应用程序代理对象，并将这个代理对象设置为应用程序对象的代理
 * - 将应用程序代理对象内的window实例化，并且设置为应用程序的keyWindow 主窗口
 * - 最后加载配置文件中指定的 storyboard[Main.storyboard] 文件中带箭头的控制器
 */

int main(int argc, char * argv[]) {
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
