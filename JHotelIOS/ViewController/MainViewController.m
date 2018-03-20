//
//  MainViewController.m
//  JHotelIOS
//
//  Created by 何苗 on 2018/3/20.
//  Copyright © 2018年 joehe. All rights reserved.
//

#import "MainViewController.h"
#import "HomeViewController.h"
#import "OrderViewController.h"

@interface MainViewController () {
    HomeViewController* vc_home;
    OrderViewController* vc_order;
    
    UINavigationController* nav_home;
    UINavigationController* nav_order;
}

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    vc_home = [[HomeViewController alloc]init];
    vc_home.tabBarItem.title = @"首页";
    vc_home.tabBarItem.image = [UIImage imageNamed:@"home"];
    nav_home = [[UINavigationController alloc]initWithRootViewController:vc_home];
    [self addChildViewController:nav_home];
    
    vc_order = [[OrderViewController alloc]init];
    vc_order.tabBarItem.title = @"订单";
    vc_order.tabBarItem.image = [UIImage imageNamed:@"shop"];
    nav_order = [[UINavigationController alloc]initWithRootViewController:vc_order];
    [self addChildViewController:nav_order];
    
    self.tabBar.tintColor = [UIColor colorWithRed:0.16 green:0.72 blue:0.55 alpha:1.0];
    self.view.backgroundColor = [UIColor whiteColor];
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
