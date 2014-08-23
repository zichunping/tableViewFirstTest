//
//  TDViewController.h
//  TableViewTest
//
//  Created by yuping on 14-8-21.
//  Copyright (c) 2014年 athrun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TDViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>{
    UITableView *dataTable;
    NSMutableArray *dataArray1;
    NSMutableArray *dataArray2;
    NSMutableArray *dataArray3;
    NSMutableArray *dataArray4;
    NSMutableArray *dataArray5;
    NSMutableArray *titleArray;
    NSMutableArray *imageArray;
}

//设置头像距离左边距的长度
@property (nonatomic,assign) float lineLeftWidth;


@property (nonatomic,strong)UIImageView *iconImage;
@property (nonatomic,strong)UILabel *titleLabel;
@property (nonatomic,strong)UILabel *subTitleLable;
@property (nonatomic, strong) UIView * badgeNumberView;

@end
