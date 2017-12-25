//
//  MineTableViewCell.h
//  ShareGrab
//
//  Created by YanHang on 2017/12/18.
//  Copyright © 2017年 DH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodListDetail.h"
@interface MineTableViewCell : UITableViewCell

//cell 展示内容
@property (nonatomic,copy) GoodListDetail * cellData;
@end
