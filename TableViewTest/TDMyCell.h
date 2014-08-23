//
//  TDMyCell.h
//  TableViewTest
//
//  Created by yuping on 14-8-23.
//  Copyright (c) 2014年 athrun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TDMyModel.h"

//自定义cell

@interface TDMyCell : UITableViewCell

@property(nonatomic,strong) UIImageView *lblImageView;
@property(nonatomic,strong) UILabel *lblTitle;
@property(nonatomic,strong) UILabel *lblSubTitle;



//设置cell
-(void) setUpCell:(TDMyModel *)model;
@end
