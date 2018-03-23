//
//  CalendarHeadView.m
//  JHotelIOS
//
//  Created by 何苗 on 2018/3/23.
//  Copyright © 2018年 joehe. All rights reserved.
//

#import "CalendarHeadView.h"
#import "Util.h"

@interface CalendarHeadView ()

@property(nonatomic, strong)UILabel* lb_month;

@end

@implementation CalendarHeadView

-(UILabel *)lb_month {
    if (!_lb_month) {
        CGRect rect = self.frame;
        rect.origin = CGPointMake(0, 0);
        _lb_month = [[UILabel alloc]initWithFrame:rect];
        _lb_month.backgroundColor = J_colorGrayLight;
        _lb_month.textColor = J_colorGrayDark;
        _lb_month.font = J_fontSmall;
        _lb_month.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_lb_month];
    }
    return _lb_month;
}

-(void)setMonth:(NSString *)month {
    self.lb_month.text = month;
}

@end
