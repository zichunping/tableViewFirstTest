//
//  TDViewController.m
//  TableViewTest
//
//  Created by yuping on 14-8-21.
//  Copyright (c) 2014年 athrun. All rights reserved.
//

#import "TDViewController.h"

@interface TDViewController ()

@end

@implementation TDViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];

    //初始化tableView
    //dataTable = [[UITableView alloc] initWithFrame:CGRectMake(2, 0, 320, 420)];//指定位置大小
    
    //使得view充满整个屏幕，这个style是分组的
    dataTable = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [dataTable setDelegate:self];//指定委托
    [dataTable setDataSource:self];//指定数据委托
    //[self.view addSubview:dataTable];
    self.view = dataTable;
    
    //初始化数据
    dataArray1 = [[NSMutableArray alloc] initWithObjects:@"中国",@"美国",@"英国", nil];
    dataArray2 = [[NSMutableArray alloc] initWithObjects:@"黄种人",@"黑种人",@"白种人", nil];
    titleArray = [[NSMutableArray alloc] initWithObjects:@"国家",@"种族", nil];
}

-(BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    return  (toInterfaceOrientation == UIInterfaceOrientationPortrait);
}

//每个section显示的标题

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
}

//指定有多少个分区(Section)，默认为1
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return [titleArray count];//返回标题数组中元素的个数来确定分区的个数
}

//指定每个分区有多少行
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    switch (section) {
        case 0:
            return [dataArray1 count];
            break;
        case 1:
            return [dataArray2 count];
            break;
        default:
            return 0;
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
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
            [[cell textLabel] setText:[dataArray1 objectAtIndex:indexPath.row]];
            break;
        case 1:
            [[cell textLabel] setText:[dataArray2 objectAtIndex:indexPath.row]];
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
    // Dispose of any resources that can be recreated.
}

@end
