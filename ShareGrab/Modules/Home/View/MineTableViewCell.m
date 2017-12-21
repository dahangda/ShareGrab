//
//  MineTableViewCell.m
//  ShareGrab
//
//  Created by YanHang on 2017/12/18.
//  Copyright © 2017年 DH. All rights reserved.
//

#import "MineTableViewCell.h"
@interface MineTableViewCell()
@property (strong, nonatomic) IBOutlet UIImageView *titleImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *oldLable;
@property (weak, nonatomic) IBOutlet UILabel *colorLable;
@property (weak, nonatomic) IBOutlet UILabel *distance;
@property (weak, nonatomic) IBOutlet UILabel *addressLable;
@property (weak, nonatomic) IBOutlet UILabel *productTimeLable;
@property (weak, nonatomic) IBOutlet UILabel *daypriceLable;




@end
@implementation MineTableViewCell

- (void)setCellData:(NSDictionary *)cellData{
    if (_cellData == NULL) {
        
        _cellData = cellData;
    }
   
    self.titleImageView.image  = [UIImage imageNamed:_cellData[@"title_icon"]];
    
    
    
    self.titleLable.text =_cellData[@"titleText"];
    
    
    self.distance.text = _cellData[@"distanceText"];
    
    self.oldLable.text = _cellData[@"oldText"];
    self.oldLable.layer.cornerRadius = 4;
    self.oldLable.layer.masksToBounds = YES;
    self.oldLable.layer.borderColor = YHRGBColor(25, 148, 252).CGColor;
      self.oldLable.layer.borderWidth = 1;
    
    self.colorLable.text = _cellData[@"colorText"];
    self.colorLable.layer.cornerRadius = 4;
    self.colorLable.layer.masksToBounds = YES;
     self.colorLable.layer.borderColor = YHRGBColor(25, 148, 252).CGColor;
    self.colorLable.layer.borderWidth = 1;
    
    self.productTimeLable.text =_cellData[@"prudentTimeLblText"];
    self.productTimeLable.layer.cornerRadius = 4;
    self.productTimeLable.layer.masksToBounds = YES;
    self.productTimeLable.layer.borderColor = YHRGBColor(25, 148, 252).CGColor;
    self.productTimeLable.layer.borderWidth = 1;
    
    NSString *address = [NSString stringWithFormat:@"地址：%@", _cellData[@"addressLblText"]];
    self.addressLable.text = address;
    NSString *price = [NSString stringWithFormat:@"%@元/天",_cellData[@"pricedayLblText"]];
    self.daypriceLable.text = price;
    
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
