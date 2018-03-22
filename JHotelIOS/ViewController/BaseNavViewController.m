//
//  BaseNavViewController.m
//  JHotelIOS
//
//  Created by 何苗 on 2018/3/21.
//  Copyright © 2018年 joehe. All rights reserved.
//

#import "BaseNavViewController.h"
#import "Util.h"
#import "HomeViewController.h"

@interface BaseNavViewController ()

@end

@implementation BaseNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 去掉顶部导航栏下面那条线
    [self.navigationBar setShadowImage:[[UIImage alloc] init]];
    
    // 设置标题颜色
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    
    // 设置渲染的颜色
    [self.navigationBar setTintColor:[UIColor whiteColor]];
    
    // 设置导航栏背景颜色
    // 设置导航栏背景图片为一个空的image，这样就透明了
    [self.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
}

// 状态栏文字颜色白色
// 相关代码 与 BaseViewController 中的代码一起完成功能
-(UIViewController *)childViewControllerForStatusBarStyle {
    return self.topViewController;
}
// 是否隐藏
//-(UIViewController *)childViewControllerForStatusBarHidden {
//    return self.topViewController;
//}

// 隐藏 tabbar
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
//    NSLog(@"pushViewController %@", viewController);
    if (![viewController isKindOfClass:[HomeViewController class]]) {
        viewController.hidesBottomBarWhenPushed = YES;
    }

    [super pushViewController:viewController animated:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
