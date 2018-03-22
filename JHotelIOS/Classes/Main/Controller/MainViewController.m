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
#import "BaseNavViewController.h"
#import "Util.h"

@interface MainViewController () {
    BaseNavViewController* nav_home;
    BaseNavViewController* nav_order;
}

@property(nonatomic, strong)HomeViewController* vc_home;
@property(nonatomic, strong)OrderViewController* vc_order;

@end

@implementation MainViewController

-(HomeViewController *)vc_home {
    if (!_vc_home) {
        _vc_home = [[HomeViewController alloc]init];
        _vc_home.tabBarItem.title = @"首页";
        _vc_home.tabBarItem.image = [UIImage imageNamed:@"home_24pt"];
    }
    return _vc_home;
}

-(OrderViewController *)vc_order {
    if (!_vc_order) {
        _vc_order = [[OrderViewController alloc]init];
        _vc_order.tabBarItem.title = @"订单";
        _vc_order.tabBarItem.image = [UIImage imageNamed:@"order_24pt"];
    }
    return _vc_order;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    nav_home = [[BaseNavViewController alloc]initWithRootViewController:self.vc_home];
    [self addChildViewController:nav_home];
    
    nav_order = [[BaseNavViewController alloc]initWithRootViewController:self.vc_order];
    [self addChildViewController:nav_order];
    
    self.tabBar.tintColor = J_colorMain;
    self.tabBar.backgroundColor = [UIColor whiteColor];
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
