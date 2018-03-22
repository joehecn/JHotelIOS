//
//  AppDelegate.m
//  JHotelIOS
//
//  Created by 何苗 on 2018/3/20.
//  Copyright © 2018年 joehe. All rights reserved.
//

#import "AppDelegate.h"
#import "Util.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

// 应用加载完毕
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // 创建 window
    self.window = [[UIWindow alloc] initWithFrame:J_screenBounds];
    
    // 创建 ViewController
    ViewController* viewController = [[ViewController alloc]init];
    
    // window 设置根控制器
    self.window.rootViewController = viewController;
    
    // window 显示
    [self.window makeKeyAndVisible];
    
    return YES;
}

// 即将变为不活跃状态 [失去焦点]
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}

// 进入后台
// 在这里保存程序状态或者数据
- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

// 即将进入前台
- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}

// 变为活跃状态 [获取焦点]
- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

// 即将销毁
// 不能保证每次执行
- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

//// 接收到内存警告
//- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
//
//}


@end
