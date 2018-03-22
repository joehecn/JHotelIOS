//
//  OrderViewController.m
//  JHotelIOS
//
//  Created by 何苗 on 2018/3/20.
//  Copyright © 2018年 joehe. All rights reserved.
//

#import "OrderViewController.h"

@interface OrderViewController ()

@end

@implementation OrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"我的订单";
    
    // 返回首页按钮
    UIImage* image = [UIImage imageNamed:@"arrowLeft_24pt"];
    // 告诉系统使用这张图片时不进行默认的渲染
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem * bbi_backHome = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStyleDone target:self action:@selector(backHomePage)];
    self.navigationItem.leftBarButtonItem = bbi_backHome;
}

-(void)backHomePage {
    self.tabBarController.selectedIndex = 0;
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
