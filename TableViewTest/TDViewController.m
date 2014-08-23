//
//  TDViewController.m
//  TableViewTest
//
//  Created by yuping on 14-8-21.
//  Copyright (c) 2014年 athrun. All rights reserved.
//

#import "TDViewController.h"
#import "TDMyModel.h"
#import "TDMyCell.h"

@interface TDViewController (){

    //定义要显示的数据
    NSArray *_dataArray;//数据数组
    NSMutableArray *_myList;//我的列表
}

@end

@implementation TDViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    //为页面增加标题
    self.title = @"我的";
    
    //使得view充满整个屏幕，这个style是分组的
    dataTable = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [dataTable setDelegate:self];//指定委托
    [dataTable setDataSource:self];//指定数据委托
    self.view = dataTable;
    
    
    TDMyModel *md1 = [[TDMyModel alloc] initWithMyID:1 cellImage: [UIImage imageNamed:@"me"] labelTitle:@"堕落天使_于平" labelSubTitle:@"账号：訾春平"];
    
    TDMyModel *md2 = [[TDMyModel alloc] initWithMyID:2 cellImage: [UIImage imageNamed:@"myVCQRScanner"] labelTitle:@"我的二维码" labelSubTitle:nil];
    
    TDMyModel *md3 = [[TDMyModel alloc] initWithMyID:3 cellImage: [UIImage imageNamed:@"myVCCollect"] labelTitle:@"收藏" labelSubTitle:nil];
    
    TDMyModel *md4 = [[TDMyModel alloc] initWithMyID:4 cellImage: [UIImage imageNamed:@"myVCInviting"] labelTitle:@"邀请" labelSubTitle:nil];
    
    TDMyModel *md5 = [[TDMyModel alloc] initWithMyID:5 cellImage: [UIImage imageNamed:@"myEmotionBox"] labelTitle:@"表情盒子" labelSubTitle:nil];
    
    TDMyModel *md6 = [[TDMyModel alloc] initWithMyID:6 cellImage: [UIImage imageNamed:@"myVCSetting"] labelTitle:@"设置" labelSubTitle:nil];
    
    TDMyModel *md7 = [[TDMyModel alloc] initWithMyID:7 cellImage: [UIImage imageNamed:@"myVCFeedBack"] labelTitle:@"帮助与反馈" labelSubTitle:nil];
    
    _dataArray = @[@[md1,md2],
                   @[md3],
                   @[md4],
                   @[md5],
                   @[md6,md7]];
}

-(BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    return  (toInterfaceOrientation == UIInterfaceOrientationPortrait);
}


//指定有多少个分区(Section)，默认为1
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return _dataArray.count;
}

//指定每个分区有多少行
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [(NSArray*)_dataArray[section] count];
}
 
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 80;
    }
    return 40;
}

-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}

-(CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}

//增加点击cell时的alert操作
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //NSString *string = _dataArray[indexPath.section][indexPath.row];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"搞鸡毛啊~~~" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}

//绘制cell，返回指定的行，由于是自定义的cell，所以此处需要返回TDMyCell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //cell标示符，使得cell能够重用
    static NSString *myCell = @"myCell";
    
    //从tableView中获取标示符为“myCell”的cell
    TDMyCell *cell = (TDMyCell *)[tableView dequeueReusableCellWithIdentifier:myCell];
    
    //如果cell == nil，表示tableview中没有可用的闲置cell
    if (cell == nil) {
        cell = [[TDMyCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:myCell];
    }
    
    //[cell setUpCell:_myList[indexPath.row]];
    [cell setUpCell:_dataArray[indexPath.section][indexPath.row]];
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
