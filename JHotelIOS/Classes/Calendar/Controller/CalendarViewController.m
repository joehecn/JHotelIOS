//
//  CalendarViewController.m
//  JHotelIOS
//
//  Created by 何苗 on 2018/3/23.
//  Copyright © 2018年 joehe. All rights reserved.
//

#import "CalendarViewController.h"
#import "Util.h"
#import "UIView+Frame.h"
#import "CalendarHeadView.h"
#import "CalendarViewCell.h"

@interface CalendarViewController () <UICollectionViewDelegate, UICollectionViewDataSource> {
    CGFloat item_w;
    NSString* identifierCell;
    NSString* identifierHead;
}

@property(nonatomic, strong)UIView* v_header;
@property(nonatomic, strong)UICollectionView* cv_calendar;

@end

@implementation CalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"选择入住离店日期";
    
    // 返回按钮
    self.navigationItem.leftBarButtonItem = self.bbi_back;
    
    item_w = J_w / 7;
    identifierCell = @"cn.joehe.ios.JHotelIOS.Classes.Calendar.Cell";
    identifierHead = @"cn.joehe.ios.JHotelIOS.Classes.Calendar.Head";
    // 头部 日123456
    [self.view addSubview:self.header];
    // calendar
    [self.view addSubview:self.cv_calendar];
}

- (UIView *)header {
    if (!_v_header) {
        CGFloat y = [[Util getInstance]getSafeYHasNavigationBar:true];
        _v_header = [[UIView alloc]initWithFrame:CGRectMake(0, y, J_w, 24)];

        NSArray* letters = @[@"日", @"一", @"二", @"三", @"四", @"五", @"六"];
        
        for (int i = 0; i < 7; i++) {
            UILabel* item = [[UILabel alloc]initWithFrame:CGRectMake(i * item_w, 0, item_w, 24)];
            item.text = letters[i];
            item.textColor = [UIColor whiteColor];
            if (i == 0 || i == 6) {
                item.textColor = [UIColor orangeColor];
            }
            item.textAlignment = NSTextAlignmentCenter;
            item.font = J_fontNormal;
            [_v_header addSubview:item];
        }
    }
    return _v_header;
}

- (UICollectionView *)cv_calendar {
    if (!_cv_calendar) {
        CGFloat y = _v_header.y + _v_header.h;
        // 实例化 方向
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        // size item header
        layout.itemSize = CGSizeMake(item_w, 48);
        layout.headerReferenceSize = CGSizeMake(J_w, 24);
        // 间距
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        
        _cv_calendar = [[UICollectionView alloc]initWithFrame:CGRectMake(0, y, J_w, J_h - y) collectionViewLayout:layout];
        _cv_calendar.delegate = self;
        _cv_calendar.dataSource = self;
        // 注册
        [_cv_calendar registerClass:[CalendarViewCell class] forCellWithReuseIdentifier:identifierCell];
        [_cv_calendar registerClass:[CalendarHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:identifierHead];
        _cv_calendar.backgroundColor = [UIColor whiteColor];
    }
    return _cv_calendar;
}

// 1 组
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 4;
}

// 2 每组 item
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 28;
}

// 3 item 内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CalendarViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifierCell forIndexPath:indexPath];
    cell.date = (int)indexPath.row;
    return cell;
}

// 4 head foot
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
//    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
//        headView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:identifierHead forIndexPath:indexPath];
//    }
    CalendarHeadView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:identifierHead forIndexPath:indexPath];
    headView.month = [NSString stringWithFormat:@"%ld", indexPath.section];
    
    return headView;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
