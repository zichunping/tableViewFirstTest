//
//  TDMyModel.h
//  TableViewTest
//
//  Created by yuping on 14-8-23.
//  Copyright (c) 2014年 athrun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TDMyModel : NSObject

@property(nonatomic,assign) NSInteger myId;
@property(nonatomic,strong) UIImage *myImage;
@property(nonatomic,strong) NSString *labelTitle;
@property(nonatomic,strong) NSString *labelSubTitle;


-(id)initWithMyID:(NSInteger) myId
        cellImage:(UIImage *) image
       labelTitle:(NSString *) title
    labelSubTitle:(NSString *) subTitle;
@end
