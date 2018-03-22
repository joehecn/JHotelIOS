//
//  CitySelectViewController.m
//  JHotelIOS
//
//  Created by 何苗 on 2018/3/22.
//  Copyright © 2018年 joehe. All rights reserved.
//

#import "CitySelectViewController.h"

@interface CitySelectViewController ()

@end

@implementation CitySelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"选择城市";
    
    // 返回按钮
    UIImage* image = [UIImage imageNamed:@"arrowLeft_24pt"];
    // 告诉系统使用这张图片时不进行默认的渲染
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem * bbi_back = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStyleDone target:self action:@selector(backLastPage)];
    self.navigationItem.leftBarButtonItem = bbi_back;
}

//-(void)viewWillAppear:(BOOL)animated {
//    // 显示 navigation
////    self.navigationController.navigationBar.hidden = false;
//
//}

-(void)backLastPage {
    [self.navigationController popViewControllerAnimated:true];
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
