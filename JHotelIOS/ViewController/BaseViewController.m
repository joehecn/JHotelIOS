//
//  BaseViewController.m
//  JHotelIOS
//
//  Created by 何苗 on 2018/3/21.
//  Copyright © 2018年 joehe. All rights reserved.
//

#import "BaseViewController.h"
#import "Util.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    // 去掉返回按钮文字
//    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
//    self.navigationItem.backBarButtonItem = backItem;
    
    self.view.backgroundColor = J_colorMain;
    
}

// 状态栏文字颜色白色 相关代码
// 与 BaseNavViewController 中的代码一起完成功能
-(UIStatusBarStyle)preferredStatusBarStyle{
    // 这里设置白色
    return UIStatusBarStyleLightContent;
}
// 是否隐藏
//-(BOOL)prefersStatusBarHidden{
//    return NO;
//}

- (UIBarButtonItem *)bbi_back {
    if (!_bbi_back) {
        // 返回按钮
        UIImage* image = [UIImage imageNamed:@"arrowLeft_24pt"];
        // 告诉系统使用这张图片时不进行默认的渲染
        image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        _bbi_back = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStyleDone target:self action:@selector(backLastPage)];
        
    }
    return _bbi_back;
}

- (void)backLastPage {
    [self.navigationController popViewControllerAnimated:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
