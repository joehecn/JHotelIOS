//
//  BtnView.h
//  JHotelIOS
//
//  Created by 何苗 on 2018/3/21.
//  Copyright © 2018年 joehe. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, BtnViewType) {
    BtnViewTypeOne = 0,
    BtnViewTypeTwo = 1,
    BtnViewTypeThird = 3
};

@interface BtnView : UIView

//@property(nonatomic, copy)NSString* title;
//@property(nonatomic, copy)NSString* subtitle;

-(instancetype)initWithPoint:(CGPoint)point andWidth:(CGFloat)width imageName:(NSString *)imageName WithType:(BtnViewType)type;
-(void)setTitle:(NSString *)title;

@end
