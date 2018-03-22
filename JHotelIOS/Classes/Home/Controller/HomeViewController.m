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
#import "CitySelectViewController.h"

@interface HomeViewController () {
    Util *util;
    CGFloat x_main;
    CGFloat w_main;
}

//@property(nonatomic, strong)UIView* v_header;
@property(nonatomic, strong)UIImageView* iv_bg;

@property(nonatomic, strong)UIView* v_main;
@property(nonatomic, strong)BtnView* bv_location;
@property(nonatomic, strong)BtnView* bv_chooseCity;
@property(nonatomic, strong)UILabel* lb_city;
@property(nonatomic, strong)BtnView* bv_chooseDates;
@property(nonatomic, strong)BtnView* bv_keyword;
@property(nonatomic, strong)UIButton* bt_search;

@property(nonatomic, strong)UIView* jv_promise;
@property(nonatomic, strong)UIView* jv_promiseModal;

@property(nonatomic, strong)CitySelectViewController* vc_citySelect;

@end

@implementation HomeViewController

//- (UIView *)v_header {
//    if (!_v_header) {
//        CGFloat y = [util getSafeYHasNavigationBar:false];
//        CGFloat h = [util getNavigationBarHeight];
//        _v_header = [[UIView alloc]initWithFrame:CGRectMake(0, y, J_w, h)];
//
//        // 返回键
//        UIButton* bt_back = [[UIButton alloc]initWithFrame:CGRectMake(10, 10, 24, 24)];
//        [bt_back setBackgroundImage:[UIImage imageNamed:@"arrowLeft_24pt"] forState:UIControlStateNormal];
//        [bt_back addTarget:self action:@selector(exitApplication) forControlEvents:UIControlEventTouchUpInside];
//        [_v_header addSubview:bt_back];
//
//        // 标题
//        UILabel* lb_title = [[UILabel alloc]initWithFrame:CGRectMake((J_w - 200) / 2, 10, 200, 24)];
//        lb_title.text = @"四季优美酒店";
//        lb_title.textColor = [UIColor whiteColor];
//        lb_title.textAlignment = NSTextAlignmentCenter;
//        lb_title.font = J_fontNav;
//        [_v_header addSubview:lb_title];
//    }
//    return _v_header;
//}

-(UIImageView *)iv_bg {
    if (!_iv_bg) {
//        CGFloat y = self.v_header.frame.origin.y + self.v_header.frame.size.height;
        CGFloat y = [util getSafeYHasNavigationBar:true];
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
        _bv_location = [[BtnView alloc]initWithPoint:CGPointMake(0, 16) andWidth:w_main / 2 imageName:@"location_24pt" titleColor:J_colorGray WithType:BtnViewTypeOne];
        [_bv_location setTitle:@"我的位置"];
    }
    return _bv_location;
}

-(BtnView *)bv_chooseCity {
    if (!_bv_chooseCity) {
        _bv_chooseCity = [[BtnView alloc]initWithPoint:CGPointMake(w_main / 2, 16) andWidth:w_main / 2 imageName:@"chooseCity_24pt" titleColor:J_colorGray WithType:BtnViewTypeTwo];
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

-(BtnView *)bv_chooseDates {
    if (!_bv_chooseDates) {
        CGFloat y = self.lb_city.frame.origin.y + self.lb_city.frame.size.height + 8 + 1 + 8;
        _bv_chooseDates = [[BtnView alloc]initWithPoint:CGPointMake(0, y) andWidth:w_main imageName:@"calendar_24pt" titleColor:[UIColor blackColor] WithType:BtnViewTypeThird];
        [_bv_chooseDates setTitle:@"3月21日-3月22日"];
        [_bv_chooseDates setSubtitle:@"今天入住 明天离店 (1晚)"];
    }
    return _bv_chooseDates;
}

-(BtnView *)bv_keyword {
    if (!_bv_keyword) {
        CGFloat y = self.bv_chooseDates.frame.origin.y + self.bv_chooseDates.frame.size.height + 8 + 1 + 16;
        _bv_keyword = [[BtnView alloc]initWithPoint:CGPointMake(0, y) andWidth:w_main imageName:@"search_24pt" titleColor:[UIColor blackColor] WithType:BtnViewTypeTwo];
        [_bv_keyword setTitle:@"五和大道南五和大道南五和大道南五和大道南五和大道南五和大道南30"];
    }
    return _bv_keyword;
}

-(UIButton *)bt_search {
    if (!_bt_search) {
        CGFloat x = 8;
        CGFloat y = self.bv_keyword.frame.origin.y + self.bv_keyword.frame.size.height + 16 + 1 + 8;
        _bt_search = [[UIButton alloc]initWithFrame:CGRectMake(x, y, w_main - x * 2, 44)];
        [_bt_search setTitle:@"开始搜索" forState:UIControlStateNormal];
        [_bt_search setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_bt_search setBackgroundColor:J_colorMain];
        _bt_search.titleLabel.font = J_fontBig;
        _bt_search.layer.cornerRadius = 5;
    }
    return _bt_search;
}

-(UIView *)v_main {
    if (!_v_main) {
        CGFloat y = self.iv_bg.frame.origin.y + self.iv_bg.frame.size.height;
        x_main = 8;
        w_main = J_w - x_main * 2;
        CGFloat h = 260;
        
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
        [_v_main addSubview:[self getLineViewWithY:self.lb_city.frame.origin.y + self.lb_city.frame.size.height + 8]];
        
        // 选择日期
        [_v_main addSubview:self.bv_chooseDates];
        
        // 分隔线
        [_v_main addSubview:[self getLineViewWithY:self.bv_chooseDates.frame.origin.y + self.bv_chooseDates.frame.size.height + 8]];
        
        // 关键词
        [_v_main addSubview:self.bv_keyword];
        
        // 分隔线
        [_v_main addSubview:[self getLineViewWithY:self.bv_keyword.frame.origin.y + self.bv_keyword.frame.size.height + 16]];
        
        // 搜索按钮
        [_v_main addSubview:self.bt_search];
        
        __weak typeof (self) weakself = self;
        self.bv_chooseCity.touchesBeganBtnView = ^() {
            [weakself.navigationController pushViewController:weakself.vc_citySelect animated:true];
        };
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
        iv_promise.image = [UIImage imageNamed:@"promise_24pt"];
        [_jv_promise addSubview:iv_promise];
        
        CGFloat lb_x = img_x + img_w + 10;
        lb_promise.frame = CGRectMake(lb_x, 0, lb_width, 24);
        [_jv_promise addSubview:lb_promise];
        
        // 点击事件
        UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showPromiseModal)];
        [_jv_promise addGestureRecognizer:recognizer];
    }
    return _jv_promise;
}

-(UIView *)jv_promiseModal {
    if (!_jv_promiseModal) {
        _jv_promiseModal = [[UIView alloc]initWithFrame:J_screenBounds];
        
        // 遮罩层
        UIView* v_cover = [[UIView alloc]initWithFrame:J_screenBounds];
        v_cover.backgroundColor = [UIColor blackColor];
        v_cover.alpha = 0.5;
        [_jv_promiseModal addSubview:v_cover];
        
        // 文字图层
        UIView* v_text = [[UIView alloc]initWithFrame:CGRectMake(0, 0, J_w * 0.8, J_h * 0.7)];
        v_text.center = v_cover.center;
        v_text.backgroundColor = [UIColor whiteColor];
        v_text.layer.cornerRadius = 5;
        
        UIButton* bt_close = [[UIButton alloc]initWithFrame:CGRectMake(v_text.frame.size.width - 24 - 16, 16, 24, 24)];
        [bt_close setBackgroundImage:[UIImage imageNamed:@"close_24pt"] forState:UIControlStateNormal];
        [v_text addSubview:bt_close];
        
        UILabel* lb_title = [[UILabel alloc]initWithFrame:CGRectMake(16, 16, v_text.frame.size.width - 16 * 2 - 24 - 16, 24)];
        lb_title.text = @"有问题, 我赔你";
        lb_title.textColor = J_colorGrayDark;
        lb_title.font = [UIFont systemFontOfSize:20];
        [v_text addSubview:lb_title];
        
        UILabel* lb_subtitle = [[UILabel alloc]initWithFrame:CGRectMake(16, lb_title.frame.size.height + lb_title.frame.origin.y, v_text.frame.size.width - 16 * 2, 24)];
        lb_subtitle.text = @"到店有房, 酒店预定有保障";
        lb_subtitle.textColor = J_colorGrayDark;
        lb_subtitle.font = J_fontBig;
        [v_text addSubview:lb_subtitle];
        
        // 分隔线
        UIView* lineView = [[UIView alloc]initWithFrame:CGRectMake(16, lb_subtitle.frame.size.height + lb_subtitle.frame.origin.y + 8, v_text.frame.size.width - 16 * 2, 1)];
        lineView.backgroundColor = J_colorGrayLight;
        [v_text addSubview:lineView];
        
        // 脚注
        UILabel* lb_foot = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, v_text.frame.size.width - 16 * 2, 10000)];
        
        lb_foot.text = @"注：如未及时联系官网自行入住其他酒店，视为您放弃了保障计划权利。";
        lb_foot.font = J_fontSmall;
        lb_foot.numberOfLines = 0;
        [lb_foot sizeToFit];
        CGFloat h = lb_foot.frame.size.height;
        
        lb_foot.frame = CGRectMake(16, v_text.frame.size.height - h - 16, v_text.frame.size.width - 16 * 2, h);
        lb_foot.textColor = J_colorGrayDark;
        
        [v_text addSubview:lb_foot];
        
        // 分隔线 逆向
        lineView = [[UIView alloc]initWithFrame:CGRectMake(16, lb_foot.frame.origin.y - 9, v_text.frame.size.width - 16 * 2, 1)];
        lineView.backgroundColor = J_colorGrayLight;
        [v_text addSubview:lineView];
        
        [_jv_promiseModal addSubview:v_text];
    }
    return _jv_promiseModal;
}

-(CitySelectViewController *)vc_citySelect {
    if (!_vc_citySelect) {
        _vc_citySelect = [[CitySelectViewController alloc]init];
//        _vc_citySelect.view.tag = 1;
    }
    return _vc_citySelect;
}

-(UIView *)getLineViewWithY:(CGFloat)y {
    UIView* lineView = [[UIView alloc]initWithFrame:CGRectMake(0, y, w_main, 1)];
    lineView.backgroundColor = J_colorGrayLight;
    return lineView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    util = [Util getInstance];
    
    // 获取并储存导航栏高度 一般为 44
    [util setNavigationBarHeight:self.navigationController.navigationBar.frame.size.height];
    
    self.navigationItem.title = @"四季优美酒店";
    
    // 退出按钮
    UIImage* image = [UIImage imageNamed:@"logout_24pt"];
    // 告诉系统使用这张图片时不进行默认的渲染
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem * bbi_loginout = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStyleDone target:self action:@selector(exitApplication)];
    self.navigationItem.rightBarButtonItem = bbi_loginout;
    
    // 自定义头部
//    [self.view addSubview:self.v_header];
    
    // 背景图
    [self.view addSubview:self.iv_bg];
    
    // 主界面
    [self.view addSubview:self.v_main];
    
    // 保障
    [self.view addSubview:self.jv_promise];
}

//-(void)viewWillAppear:(BOOL)animated {
//    // 隐藏 navigation
////    self.navigationController.navigationBar.hidden = true;
//}

- (void)showPromiseModal {
    // 添加到最外层的控制器
    [self.tabBarController.view addSubview:self.jv_promiseModal];
}

// 退出程序
- (void)exitApplication {
    self.tabBarController.tabBar.hidden = true;

    UIWindow *window = [[Util getInstance]getApp].window;
    [UIView beginAnimations:@"exitApplication" context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:window cache:NO];
    [UIView setAnimationDidStopSelector:@selector(animationFinished:finished:context:)];
    window.bounds = CGRectMake(0, 0, 0, 0);
    [UIView commitAnimations];
}
- (void)animationFinished:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
    if ([animationID compare:@"exitApplication"] == 0) {
        exit(0);
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
