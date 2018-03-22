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
}

-(void)viewWillAppear:(BOOL)animated {
    // 显示 navigation
//    self.navigationController.navigationBar.hidden = false;
    
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
