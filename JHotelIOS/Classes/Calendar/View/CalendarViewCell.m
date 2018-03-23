//
//  CalendarViewCell.m
//  JHotelIOS
//
//  Created by 何苗 on 2018/3/23.
//  Copyright © 2018年 joehe. All rights reserved.
//

#import "CalendarViewCell.h"
#import "Util.h"

@interface CalendarViewCell ()

@property(nonatomic, strong)UILabel* lb_date;

@end

@implementation CalendarViewCell

-(UILabel *)lb_date {
    if (!_lb_date) {
        CGRect rect = self.frame;
        rect.origin = CGPointMake(0, 0);
        _lb_date = [[UILabel alloc]initWithFrame:rect];
        _lb_date.textColor = [UIColor blackColor];
        _lb_date.font = J_fontNormal;
        _lb_date.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_lb_date];
    }
    return _lb_date;
}

-(void)setDate:(int)date {
    self.lb_date.text = [NSString stringWithFormat:@"%d", date];
}

@end
