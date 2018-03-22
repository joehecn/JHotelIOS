//
//  ViewController.m
//  JHotelIOS
//
//  Created by 何苗 on 2018/3/20.
//  Copyright © 2018年 joehe. All rights reserved.
//

#import "ViewController.h"
#import "MainViewController.h"
#import "Util.h"

@interface ViewController () {
    MainViewController* vc_main;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // TODO: 新手引导页
    [self enterApp];
}

-(void)enterApp {
    vc_main = [[MainViewController alloc]init];
    // 切换根控制器
    [[Util getInstance]getApp].window.rootViewController = vc_main;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
