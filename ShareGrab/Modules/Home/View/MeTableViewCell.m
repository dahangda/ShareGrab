//
//  MeTableViewCell.m
//  MyApp
//
//  Created by 燕航 on 2017/11/24.
//  Copyright © 2017年 yanhang. All rights reserved.
//

#import "MeTableViewCell.h"
@interface MeTableViewCell()
@property (nonatomic, strong) UIImageView *titleIcon;//标题图标
@property (nonatomic, strong) UILabel *titleLbl;//标题
@property (nonatomic, strong) UILabel *oldLbl;//内容

@property (nonatomic, strong) UIImageView *arrowIcon;//距离
@end
@implementation MeTableViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

//- (void)awakeFromNib {
//    [super awakeFromNib];
//    // Initialization code
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
