//
//  KeywordViewController.m
//  JHotelIOS
//
//  Created by 何苗 on 2018/3/23.
//  Copyright © 2018年 joehe. All rights reserved.
//

#import "KeywordViewController.h"

@interface KeywordViewController ()

@end

@implementation KeywordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"搜索关键词";
    
    // 返回按钮
    self.navigationItem.leftBarButtonItem = self.bbi_back;
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
