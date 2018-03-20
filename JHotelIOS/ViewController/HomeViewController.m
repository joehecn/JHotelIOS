//
//  HomeViewController.m
//  JHotelIOS
//
//  Created by 何苗 on 2018/3/20.
//  Copyright © 2018年 joehe. All rights reserved.
//

#import "HomeViewController.h"
#import "Util.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 获取并储存导航栏高度 一般为 44
    [[Util getInstance]setNavigationBarHeight:self.navigationController.navigationBar.frame.size.height];
    
    // 隐藏 navigation
    self.navigationController.navigationBar.hidden = true;
    
    NSLog(@"%f", [[Util getInstance]getSafeXHasNavigationBar:false]);
    NSLog(@"%f", [[Util getInstance]getSafeXHasNavigationBar:true]);
    
    UIView* redView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, J_w, 100)];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    UIView* blueView = [[UIView alloc]initWithFrame:CGRectMake(0, 100, J_w, 100)];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
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
