//
//  HomeViewController.m
//  JHotelIOS
//
//  Created by 何苗 on 2018/3/20.
//  Copyright © 2018年 joehe. All rights reserved.
//

#import "HomeViewController.h"
#import "Util.h"
#import "BtnView.h"

@interface HomeViewController () {
    Util *util;
    CGFloat x_main;
    CGFloat w_main;
}

@property(nonatomic, strong)UIView* v_header;
@property(nonatomic, strong)UIImageView* iv_bg;

@property(nonatomic, strong)UIView* v_main;
@property(nonatomic, strong)BtnView* bv_location;
@property(nonatomic, strong)BtnView* bv_chooseCity;
@property(nonatomic, strong)UILabel* lb_city;

@property(nonatomic, strong)UIView* jv_promise;

@end

@implementation HomeViewController

- (UIView *)v_header {
    if (!_v_header) {
        CGFloat y = [util getSafeYHasNavigationBar:false];
        CGFloat h = [util getNavigationBarHeight];
        _v_header = [[UIView alloc]initWithFrame:CGRectMake(0, y, J_w, h)];
        
        // 返回键
        UIButton* bt_back = [[UIButton alloc]initWithFrame:CGRectMake(10, 10, 24, 24)];
        [bt_back setBackgroundImage:[UIImage imageNamed:@"order_24pt"] forState:UIControlStateNormal];
        [bt_back addTarget:self action:@selector(exitApplication) forControlEvents:UIControlEventTouchUpInside];
        [_v_header addSubview:bt_back];
        
        // 标题
        UILabel* lb_title = [[UILabel alloc]initWithFrame:CGRectMake((J_w - 200) / 2, 10, 200, 24)];
        lb_title.text = @"四季优美酒店";
        lb_title.textColor = [UIColor whiteColor];
        lb_title.textAlignment = NSTextAlignmentCenter;
        lb_title.font = J_fontNav;
        [_v_header addSubview:lb_title];
    }
    return _v_header;
}

-(UIImageView *)iv_bg {
    if (!_iv_bg) {
        CGFloat y = self.v_header.frame.origin.y + self.v_header.frame.size.height;
        CGFloat w = J_w * 0.6;
        CGFloat h = w * 0.6;
        CGFloat x = (J_w - w) / 2;
        

        _iv_bg = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
        _iv_bg.image = [UIImage imageNamed:@"bg_200pt_120pt"];
    }
    return _iv_bg;
}

-(BtnView *)bv_location {
    if (!_bv_location) {
        _bv_location = [[BtnView alloc]initWithPoint:CGPointMake(0, 16) andWidth:w_main / 2 imageName:@"order_24pt" WithType:BtnViewTypeOne];
        [_bv_location setTitle:@"我的位置"];
    }
    return _bv_location;
}

-(BtnView *)bv_chooseCity {
    if (!_bv_chooseCity) {
        _bv_chooseCity = [[BtnView alloc]initWithPoint:CGPointMake(w_main / 2, 16) andWidth:w_main / 2 imageName:@"order_24pt" WithType:BtnViewTypeTwo];
        [_bv_chooseCity setTitle:@"选择城市"];
    }
    return _bv_chooseCity;
}

-(UILabel *)lb_city {
    if (!_lb_city) {
        CGFloat y = self.bv_location.frame.origin.y + self.bv_location.frame.size.height;
        _lb_city = [[UILabel alloc]initWithFrame:CGRectMake(40, y, w_main - 40, 24)];
        _lb_city.text = @"深圳";
        _lb_city.textColor = [UIColor blackColor];
        _lb_city.font = J_fontBig;
    }
    return _lb_city;
}

-(UIView *)v_main {
    if (!_v_main) {
        CGFloat y = self.iv_bg.frame.origin.y + self.iv_bg.frame.size.height;
        x_main = 8;
        w_main = J_w - x_main * 2;
        CGFloat h = 300;
        
        _v_main = [[UIView alloc]initWithFrame:CGRectMake(x_main, y, w_main, h)];
        _v_main.backgroundColor = [UIColor whiteColor];
        _v_main.layer.cornerRadius = 5;
        
        // 我的位置
        [_v_main addSubview:self.bv_location];
        
        // 选择城市
        [_v_main addSubview:self.bv_chooseCity];
        
        // label 深圳
        [_v_main addSubview:self.lb_city];
        
        // 分隔线
        [_v_main addSubview:[self getLineViewWithY:self.lb_city.frame.origin.y + self.lb_city.frame.size.height + 2]];
        
//        UIButton* bt_search = [[UIButton alloc]initWithFrame:CGRectMake(x, x, w - x * 2, 44)];
//        [bt_search setTitle:@"开始搜索" forState:UIControlStateNormal];
//        [bt_search setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        [bt_search setBackgroundColor:J_colorMain];
//        bt_search.titleLabel.font = J_fontBig;
//        bt_search.layer.cornerRadius = 5;
//        [_v_main addSubview:bt_search];
    }
    return _v_main;
}

-(UIView *)jv_promise {
    if (!_jv_promise) {
        CGFloat y = self.v_main.frame.origin.y + self.v_main.frame.size.height + 10;
        _jv_promise = [[UIView alloc]initWithFrame:CGRectMake(0, y, J_w, 24)];
        
        UILabel* lb_promise = [[UILabel alloc]init];
        lb_promise.text = @"全程有保障 住哪都放心";
        lb_promise.textColor = [UIColor whiteColor];
        lb_promise.font = J_fontSmall;
        [lb_promise sizeToFit];
        CGFloat lb_width = lb_promise.frame.size.width;
        
        CGFloat img_w = 24;
        CGFloat img_x = (J_w - (img_w + 10 + lb_width)) / 2;
        
        UIImageView* iv_promise = [[UIImageView alloc]initWithFrame:CGRectMake(img_x, 0, img_w, 24)];
        iv_promise.image = [UIImage imageNamed:@"order_24pt"];
        [_jv_promise addSubview:iv_promise];
        
        CGFloat lb_x = img_x + img_w + 10;
        lb_promise.frame = CGRectMake(lb_x, 0, lb_width, 24);
        [_jv_promise addSubview:lb_promise];
    }
    return _jv_promise;
}

-(UIView *)getLineViewWithY:(CGFloat)y {
    UIView* lineView = [[UIView alloc]initWithFrame:CGRectMake(0, y, w_main, 1)];
    lineView.backgroundColor = J_colorGray;
    return lineView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    util = [Util getInstance];
    
    // 获取并储存导航栏高度 一般为 44
    [util setNavigationBarHeight:self.navigationController.navigationBar.frame.size.height];
    
    // 隐藏 navigation
    self.navigationController.navigationBar.hidden = true;
    
    // 自定义头部
    [self.view addSubview:self.v_header];
    
    // 背景图
    [self.view addSubview:self.iv_bg];
    
    // 主界面
    [self.view addSubview:self.v_main];
    
    // 保障
    [self.view addSubview:self.jv_promise];
}

// 退出程序
- (void)exitApplication {
    if (self.exitApp) {
        self.exitApp();
    }
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
