//
//  UIView+Frame.h
//  JHotelIOS
//
//  Created by 何苗 on 2018/3/22.
//  Copyright © 2018年 joehe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

// 分类里面不能生成成员属性
// 会自动生成get，set方法和成员属性

// @property如果在分类里面只会生成get,set方法的声明，并不会生成成员属性。
@property(nonatomic, assign)CGFloat x;
@property(nonatomic, assign)CGFloat y;
@property(nonatomic, assign)CGFloat w;
@property(nonatomic, assign)CGFloat h;

@end
