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
    NSMutableArray *titleArray;
}

@end
