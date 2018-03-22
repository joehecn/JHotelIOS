//
//  PromiseModalView.m
//  JHotelIOS
//
//  Created by 何苗 on 2018/3/22.
//  Copyright © 2018年 joehe. All rights reserved.
//
// 有房保障：订单确认后官网保证消费者按照订单价格入住，如产生以下情况，承诺相应赔付：
// * 消费者到店前，酒店（供应商）告知无法安排入住或要求加价入住的，官网将退还全部预订费用（如有），并赔付消费者另行预定注入附近同等酒店房间的差价（不超过订单首晚房费的30%）。
// * 如有消费者到点无房且协调无果，官网赔付消费者另行预定入住附近同等酒店房间的差价，但最高不超过订单首晚房费。
// * 请保留酒店的相关凭证（发票+水单）向官网提交赔付申请，在核对凭证无误后官网将赔付差价。

#import "PromiseModalView.h"
#import "Util.h"
#import "UIView+Frame.h"

@interface PromiseModalView () {
    UIView* v_cover;
    UIView* v_text;
}
@end

@implementation PromiseModalView

- (instancetype)initWithFrame:(CGRect)frame {
    CGFloat w = frame.size.width;
    CGFloat h = frame.size.height;
    
    if (self = [super initWithFrame:frame]) {
        // 遮罩层
        v_cover = [[UIView alloc]initWithFrame:frame];
        v_cover.backgroundColor = [UIColor blackColor];
        v_cover.alpha = 0.5;
        
        [self addSubview:v_cover];
        
        // 文字图层
        v_text = [[UIView alloc]initWithFrame:CGRectMake(0, 0, w * 0.8, h * 0.6)];
        CGPoint center = v_cover.center;
        center.y += v_cover.h;
        v_text.center = center;
        v_text.backgroundColor = [UIColor whiteColor];
        v_text.layer.cornerRadius = 5;
        
        UIButton* bt_close = [[UIButton alloc]initWithFrame:CGRectMake(v_text.w - 24 - 16, 16, 24, 24)];
        [bt_close setBackgroundImage:[UIImage imageNamed:@"close_24pt"] forState:UIControlStateNormal];
        [v_text addSubview:bt_close];
        
        CGFloat width = v_text.w - 16 * 2;
        
        UILabel* lb_title = [[UILabel alloc]initWithFrame:CGRectMake(16, 16,  width - 24 - 16, 24)];
        lb_title.text = @"有问题, 我赔你";
        lb_title.textColor = J_colorGrayDark;
        lb_title.font = [UIFont systemFontOfSize:20];
        [v_text addSubview:lb_title];
        
        UILabel* lb_subtitle = [[UILabel alloc]initWithFrame:CGRectMake(16, lb_title.h + lb_title.y, width, 24)];
        lb_subtitle.text = @"到店有房, 酒店预定有保障";
        lb_subtitle.textColor = J_colorGrayDark;
        lb_subtitle.font = J_fontBig;
        [v_text addSubview:lb_subtitle];
        
        // 分隔线1
        UIView* lineView1 = [[UIView alloc]initWithFrame:CGRectMake(16, lb_subtitle.h + lb_subtitle.y + 8, width, 1)];
        lineView1.backgroundColor = J_colorGrayLight;
        [v_text addSubview:lineView1];
        
        // 脚注
        UILabel* lb_foot = [self createLabel:width
                                        text:@"注：如未及时联系官网自行入住其他酒店，视为您放弃了保障计划权利。"
                                        font:J_fontSmall];
        lb_foot.frame = CGRectMake(16, v_text.h - lb_foot.h - 16, lb_foot.w, lb_foot.h);
        lb_foot.textColor = J_colorGrayDark;
        
        [v_text addSubview:lb_foot];
        
        // 分隔线2 逆向
        UIView* lineView2 = [[UIView alloc]initWithFrame:CGRectMake(16, lb_foot.y - 9, width, 1)];
        lineView2.backgroundColor = J_colorGrayLight;
        [v_text addSubview:lineView2];
        
        // 可滚动的内容区
        UIScrollView* sv_content = [[UIScrollView alloc]initWithFrame:CGRectMake(16, lineView1.y + 9, width, lineView2.y - lineView1.y - 16)];
//        sv_content.backgroundColor = [UIColor grayColor];
        
        UILabel* sv_lb_1 = [self createLabel:width
                                        text:@"有房保障：订单确认后官网保证消费者按照订单价格入住，如产生以下情况，承诺相应赔付："
                                        font:J_fontNormal];
        sv_lb_1.textColor = J_colorGrayDark;
        [sv_content addSubview:sv_lb_1];
        
        UILabel* sv_lb_2 = [self createLabel:width - 8 text:@"* 消费者到店前，酒店（供应商）告知无法安排入住或要求加价入住的，官网将退还全部预订费用（如有），并赔付消费者另行预定注入附近同等酒店房间的差价（不超过订单首晚房费的30%）。" font:J_fontNormal];
        sv_lb_2.frame = CGRectMake(8, sv_lb_1.h + 4, sv_lb_2.w, sv_lb_2.h);
        sv_lb_2.textColor = J_colorGrayDark;
        [sv_content addSubview:sv_lb_2];
        
        UILabel* sv_lb_3 = [self createLabel:width - 8 text:@"* 如有消费者到点无房且协调无果，官网赔付消费者另行预定入住附近同等酒店房间的差价，但最高不超过订单首晚房费。" font:J_fontNormal];
        sv_lb_3.frame = CGRectMake(8, sv_lb_2.y + sv_lb_2.h + 4, sv_lb_3.w, sv_lb_3.h);
        sv_lb_3.textColor = J_colorGrayDark;
        [sv_content addSubview:sv_lb_3];
//
        UILabel* sv_lb_4 = [self createLabel:width - 8 text:@"* 请保留酒店的相关凭证（发票+水单）向官网提交赔付申请，在核对凭证无误后官网将赔付差价。" font:J_fontNormal];
        sv_lb_4.frame = CGRectMake(8, sv_lb_3.y + sv_lb_3.h + 4, sv_lb_4.w, sv_lb_4.h);
        sv_lb_4.textColor = J_colorGrayDark;
        [sv_content addSubview:sv_lb_4];
        
        sv_content.contentSize = CGSizeMake(width, sv_lb_4.y + sv_lb_4.h + 8);
        
        [v_text addSubview:sv_content];
        
        // 点击事件
        [bt_close addTarget:self action:@selector(closeAction) forControlEvents:UIControlEventTouchUpInside];
        UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeAction)];
        [v_cover addGestureRecognizer:recognizer];
        
        [self addSubview:v_text];
    }
    return self;
}

- (UILabel *)createLabel:(CGFloat)width text:(NSString *)text font:(UIFont *)font {
    CGRect frame = CGRectMake(0, 0, width, 10000);
    
    UILabel* lb = [[UILabel alloc]initWithFrame:frame];
    lb.text = text;
    lb.font = font;
    lb.numberOfLines = 0;
    [lb sizeToFit];
    frame.size.height = lb.h;
    lb.frame = frame;

    return lb;
}

- (void)show {
    self.hidden = false;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:v_text cache:NO];
    
    v_text.center = v_cover.center;
    
    [UIView commitAnimations];
}

- (void) closeAction {
    [UIView beginAnimations:@"moveTextView" context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:v_text cache:NO];
    [UIView setAnimationDidStopSelector:@selector(animationFinished:finished:context:)];
    
    CGPoint center = v_cover.center;
    center.y += v_cover.h;
    v_text.center = center;
    
    [UIView commitAnimations];
}

- (void)animationFinished:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
    if ([animationID compare:@"moveTextView"] == 0) {
        self.hidden = true;
    }
}

@end
