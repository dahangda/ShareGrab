//
//  MineTableViewCell.m
//  ShareGrab
//
//  Created by YanHang on 2017/12/18.
//  Copyright © 2017年 DH. All rights reserved.
//

#import "MineTableViewCell.h"
#import "UIImageView+WebCache.h"
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

- (void)setCellData:(GoodListDetail *)cellData{
    if (_cellData == NULL) {
        
        _cellData = cellData;
    }
   
    [self.titleImageView  sd_setImageWithURL:[NSURL URLWithString:cellData.GoodsPic]];
    
    YHLog(@"%@",_cellData.GoodsName);
    self.titleLable.text =[_cellData.GoodsName mutableCopy];
    
    
   self.distance.text = [NSString stringWithFormat:@"%@km",cellData.Distance];

    



   YHLog(@"=======%@",cellData.LabelContent);
#pragma mark ********************contentlable 颜色设置

    self.oldLable.layer.cornerRadius = 4;
    self.oldLable.layer.masksToBounds = YES;
    self.oldLable.layer.borderColor = YHRGBColor(25, 148, 252).CGColor;
    self.oldLable.layer.borderWidth = 1;
    
    self.colorLable.layer.cornerRadius = 4;
    self.colorLable.layer.masksToBounds = YES;
    self.colorLable.layer.borderColor = YHRGBColor(25, 148, 252).CGColor;
    self.colorLable.layer.borderWidth = 1;
    
    self.productTimeLable.layer.cornerRadius = 4;
    self.productTimeLable.layer.masksToBounds = YES;
    self.productTimeLable.layer.borderColor = YHRGBColor(25, 148, 252).CGColor;
    self.productTimeLable.layer.borderWidth = 1;
    
    
   NSArray *arr1 = [cellData.LabelContent componentsSeparatedByString:@";"];
    YHLog(@"%lu",arr1.count);
    if (arr1.count == 2) {
        self.colorLable.hidden = YES;
        self.productTimeLable.hidden = YES;
    }
    if(arr1.count == 3){
        self.productTimeLable.hidden = YES;
    }
    
    for (NSUInteger i = 0; i < arr1.count ; i ++) {
        if (i == 0) {
            NSString *string1 = arr1[0];
            NSArray * arr1 = [string1 componentsSeparatedByString:@","];
            self.oldLable.text = arr1[1];
        }
        if (i == 1) {
          
            NSString *string1 = arr1[1];
            NSArray * arr1 = [string1 componentsSeparatedByString:@","];
                self.colorLable.text = arr1.lastObject;
                
            
        }
        if (i == 2) {
           
            
            NSString *string1 = arr1[2];
            NSArray * arr1 = [string1 componentsSeparatedByString:@","];
            self.productTimeLable.text = arr1.lastObject;
        }
        
    }
    
        
    
    
 
   
    
//    NSString *address = [NSString stringWithFormat:@"地址：%@", _cellData.Address];
       NSString *address = [NSString stringWithFormat:@"地址：%@", _cellData.Address];
    self.addressLable.text = address;
//    NSString *price = [NSString stringWithFormat:@"%@元/天",_cellData.GoodsUsePrice];
    NSString *price = [NSString stringWithFormat:@"%@元/天",_cellData.GoodsUsePrice];
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
