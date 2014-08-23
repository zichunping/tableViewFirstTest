//
//  TDViewController.m
//  TableViewTest
//
//  Created by yuping on 14-8-21.
//  Copyright (c) 2014年 athrun. All rights reserved.
//

#import "TDViewController.h"

@interface TDViewController (){
}

@end

@implementation TDViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    //设置页面标题
    //[self.view bringSubviewToFront:self.titleLabel];
    //self.titleLabel.text = @"我的";
    self.title = @"我的";

    //初始化tableView
    //dataTable = [[UITableView alloc] initWithFrame:CGRectMake(2, 0, 320, 420)];//指定位置大小
    
    //使得view充满整个屏幕，这个style是分组的
    dataTable = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [dataTable setDelegate:self];//指定委托
    
    
    
    [dataTable setDataSource:self];//指定数据委托
    
    
    //[self.view addSubview:dataTable];
    self.view = dataTable;
    
    //初始化数据
    dataArray1 = [[NSMutableArray alloc] initWithObjects:@"堕落天使_于平",@"我的二维码", nil];
    dataArray2 = [[NSMutableArray alloc] initWithObjects:@"收藏", nil];
    dataArray3 = [[NSMutableArray alloc] initWithObjects:@"邀请", nil];
    dataArray4 = [[NSMutableArray alloc] initWithObjects:@"表情盒子", nil];
    dataArray5 = [[NSMutableArray alloc] initWithObjects:@"设置",@"帮助与反馈", nil];
    //dataArray2 = [[NSMutableArray alloc] initWithObjects:@"黄种人",@"黑种人",@"白种人", nil];
    //titleArray = [[NSMutableArray alloc] initWithObjects:@"功能",@"种族", nil];
    
    titleArray = [[NSMutableArray alloc] initWithObjects:@"功能",@"收藏",@"邀请",@"表情盒子",@"设置", nil];
    
    //初始化图片
    imageArray = [[NSMutableArray alloc] initWithObjects:@"me",@"myVCQRScanner",@"myVCCollect",@"myVCInviting",@"myEmotionBox",@"myVCSetting",@"myVCFeedBack", nil];
    
    
}



//为tableview cell增加点击事件，弹出alert
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    /*
    UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"提示"
                                                  message:@"请先登陆"
                                                 delegate:self
                                        cancelButtonTitle:@"确定"
                                        otherButtonTitles:@"取消",nil];
     */
    //alert选中的那个cell的数据
    NSString *titleString = [dataArray1 objectAtIndex:[indexPath row]];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:titleString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    return  (toInterfaceOrientation == UIInterfaceOrientationPortrait);
}

//每个section显示的标题
/*
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return [titleArray objectAtIndex:section];
            break;
        case 1:
            return [titleArray objectAtIndex:section];
            break;
        default:
            return @"Unknown";
            break;
    }
    return [titleArray objectAtIndex:section];
}
*/

//指定有多少个分区(Section)，默认为1
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return [titleArray count];//返回标题数组中元素的个数来确定分区的个数
    //return 1;
}

//指定每个分区有多少行
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    switch (section) {
        case 0:
            return [dataArray1 count];
        case 1:
            return [dataArray2 count];
        case 2:
            return [dataArray3 count];
        case 3:
            return [dataArray4 count];
        case 4:
            return [dataArray5 count];
        default:
            return 0;
    }
    //return [dataArray1 count];
}



//设置section之间的间距
-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20.0;
}

//指定section的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

-(CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 2.0;
}

//绘制cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"Cell";
    //初始化cell，并指定其类型，也可以自定义cell
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    switch (indexPath.section) {
        case 0:
            [[cell imageView] setImage:[UIImage imageNamed:[imageArray objectAtIndex:indexPath.row]]];
            [[cell textLabel] setText:[dataArray1 objectAtIndex:indexPath.row]];
            break;
        case 1:
            [[cell imageView] setImage:[UIImage imageNamed:[imageArray objectAtIndex:2]]];
            [[cell textLabel] setText:[dataArray2 objectAtIndex:indexPath.row]];
            break;
        case 2:
            [[cell imageView] setImage:[UIImage imageNamed:[imageArray objectAtIndex:3]]];
            [[cell textLabel] setText:[dataArray3 objectAtIndex:indexPath.row]];
            break;
        case 3:
            [[cell imageView] setImage:[UIImage imageNamed:[imageArray objectAtIndex:4]]];
            [[cell textLabel] setText:[dataArray4 objectAtIndex:indexPath.row]];
            break;
        case 4:
            [[cell imageView] setImage:[UIImage imageNamed:[imageArray objectAtIndex: (5 + indexPath.row)]]];
            
            [[cell textLabel] setText:[dataArray5 objectAtIndex:indexPath.row]];
            break;
        default:
            [[cell textLabel] setText:@"Unknon"];
            break;
    }

    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
