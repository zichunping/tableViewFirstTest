//
//  TDMyModel.m
//  TableViewTest
//
//  Created by yuping on 14-8-23.
//  Copyright (c) 2014年 athrun. All rights reserved.
//

#import "TDMyModel.h"

@implementation TDMyModel

//初始化MyModel

-(id)initWithMyID:(NSInteger)myId cellImage:(UIImage *)image labelTitle:(NSString *)title labelSubTitle:(NSString *)subTitle{

    self = [super self];
    if(self){
        self.myId = myId;
        self.myImage = image;
        self.labelTitle = title;
        self.labelSubTitle = subTitle;
    }
    return self;
}

@end
