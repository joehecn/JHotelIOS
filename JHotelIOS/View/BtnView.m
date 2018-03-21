//
//  BtnView.m
//  JHotelIOS
//
//  Created by 何苗 on 2018/3/21.
//  Copyright © 2018年 joehe. All rights reserved.
//

#import "BtnView.h"
#import "Util.h"

@interface BtnView () {
    UILabel* lb_title;
}
@end

@implementation BtnView

-(instancetype)initWithPoint:(CGPoint)point andWidth:(CGFloat)width imageName:(NSString *)imageName WithType:(BtnViewType)type {
    CGFloat y = point.y;
    
    CGFloat h = 24;
    CGFloat iv_img_y = 0;
    
    if (type == BtnViewTypeThird) {
        h = 48;
        iv_img_y = (h - 24) / 2;
    }

    self = [super initWithFrame:CGRectMake(point.x, y, width, h)];
    if (self) {
        UIImageView* iv_left = [[UIImageView alloc]initWithFrame:CGRectMake(8, iv_img_y, 24, 24)];
        iv_left.image = [UIImage imageNamed:imageName];
        [self addSubview:iv_left];
        
        lb_title = [[UILabel alloc]initWithFrame:CGRectMake(40, 0, width - 40, 24)];
        lb_title.textColor = J_colorGray;
        lb_title.font = J_fontBig;
        [self addSubview:lb_title];
        
        if (type != BtnViewTypeOne) {
            UIImageView* iv_right = [[UIImageView alloc]initWithFrame:CGRectMake(width - 8 - 24, iv_img_y, 24, 24)];
            iv_right.image = [UIImage imageNamed:imageName];
            [self addSubview:iv_right];
        }
        
        self.backgroundColor = [UIColor redColor];
    }
    
    return self;
}

-(void)setTitle:(NSString *)title {
    lb_title.text = title;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
