//
//  TDMyCell.m
//  TableViewTest
//
//  Created by yuping on 14-8-23.
//  Copyright (c) 2014年 athrun. All rights reserved.
//

#import "TDMyCell.h"

//全局变量，记录该类的加载次数
static int count = 0;
@implementation TDMyCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        if (count == 0) {
            self.lblImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 8, 60, 60)];
            self.lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(80, 5, 120, 30)];
            self.lblSubTitle = [[UILabel alloc] initWithFrame:CGRectMake(80, 22, 100, 40)];
        }else{
            self.lblImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 30, 30)];
            self.lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(40, 5, 120, 30)];
            self.lblSubTitle = [[UILabel alloc] initWithFrame:CGRectMake(40, 22, 100, 40)];
        }
        //self.lblImageView.contentMode = UIViewContentModeCenter;
        [self.contentView addSubview:self.lblImageView];
        
        [self.contentView addSubview:self.lblTitle];
        
        
        self.lblSubTitle.font = [UIFont fontWithName:@"Arial" size:15];
        [self.contentView addSubview:self.lblSubTitle];
    }
    count ++;
    return self;
}

- (CGFloat)right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


//设置cell
-(void) setUpCell:(TDMyModel *)model{
    
    self.lblImageView.image = model.myImage;
    
    self.lblTitle.text = model.labelTitle;
    self.lblSubTitle.text = model.labelSubTitle;
}
@end
