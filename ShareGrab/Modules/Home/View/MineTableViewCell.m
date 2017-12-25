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
   
//    self.titleImageView.image  = [UIImage imageNamed:_cellData[@"title_icon"]];
    //cellData.GoodsPic
    [self.titleImageView  sd_setImageWithURL:[NSURL URLWithString:@"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3529824170,3396303915&fm=27&gp=0.jpg"]];
    
    
//    self.titleLable.text =_cellData.GoodsName;
    self.titleLable.text = @"公寓";
    
//    self.distance.text = _cellData.Distance;
    self.distance.text = @"2KM";
    
   // NSString *string = [_cellData.LabelContent copy];
    NSString *string = @"卫生,干净;大小,大;";
//    NSArray *arr = [NSArray new];
//    YHLog(@"=======%@",cellData.LabelContent);
   NSArray *arr = [string componentsSeparatedByString:@";"];
    
    for (NSUInteger i = 0; i < arr.count - 1; i ++) {
        if (i == 0) {
            NSString *string1 = arr[i];
            NSArray * arr1 = [string1 componentsSeparatedByString:@","];
            self.oldLable.text = arr1[1];
        }
        if (i == 1) {
            NSString *string1 = arr[i];
            NSArray * arr1 = [string1 componentsSeparatedByString:@","];
            self.colorLable.text = arr1[1];
        }
        if (i == 2) {
            NSString *string1 = arr[i];
            NSArray * arr1 = [string1 componentsSeparatedByString:@","];
            self.productTimeLable.text = arr1[1];
        }
        
    }
    if (self.oldLable.text != nil) {
        self.oldLable.layer.cornerRadius = 4;
        self.oldLable.layer.masksToBounds = YES;
        self.oldLable.layer.borderColor = YHRGBColor(25, 148, 252).CGColor;
        self.oldLable.layer.borderWidth = 1;
    }
    else{
        
        self.oldLable.hidden = YES;
    }
    
    if (self.colorLable.text != nil) {
        self.colorLable.layer.cornerRadius = 4;
        self.colorLable.layer.masksToBounds = YES;
        self.colorLable.layer.borderColor = YHRGBColor(25, 148, 252).CGColor;
        self.colorLable.layer.borderWidth = 1;
    }
    else{
        self.colorLable.hidden = YES;
    }
   
    if ((self.productTimeLable.text != nil)) {
        self.productTimeLable.layer.cornerRadius = 4;
        self.productTimeLable.layer.masksToBounds = YES;
        self.productTimeLable.layer.borderColor = YHRGBColor(25, 148, 252).CGColor;
        self.productTimeLable.layer.borderWidth = 1;
    }
    
    else{
        self.productTimeLable.hidden = YES;
    }
   
    
//    NSString *address = [NSString stringWithFormat:@"地址：%@", _cellData.Address];
       NSString *address = [NSString stringWithFormat:@"地址：%@", @"石景山区苹果园一号院"];
    self.addressLable.text = address;
//    NSString *price = [NSString stringWithFormat:@"%@元/天",_cellData.GoodsUsePrice];
    NSString *price = [NSString stringWithFormat:@"%@元/天",@"2"];
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
