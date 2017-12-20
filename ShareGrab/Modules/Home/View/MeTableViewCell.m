//
//  MeTableViewCell.m
//  MyApp
//
//  Created by 燕航 on 2017/11/24.
//  Copyright © 2017年 yanhang. All rights reserved.
//20 40  40

#import "MeTableViewCell.h"
@interface MeTableViewCell()
@property (nonatomic, strong) UIImageView *titleIcon;//标题图标
@property (nonatomic, strong) UILabel *titleLbl;//标题
@property (nonatomic, strong) UILabel  *distanceLbl; //距离
@property (nonatomic, strong) UILabel *oldLbl;//内容
@property (nonatomic, strong) UILabel  *colorLbl; //颜色
@property (nonatomic, strong) UILabel  *prudentTimeLbl; //生产日期
@property (nonatomic, strong) UILabel  *addressLbl; //地址


@end
@implementation MeTableViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}


-(void)setCellData:(NSDictionary *)cellData{
   
    if (_cellData == nil) {
         _cellData = cellData;
    }
    else
    {
        //标题图片
        if (_cellData[@"title_icon"] == nil) {
            [self.titleIcon setImage:[UIImage imageNamed:@"tuli"]];
        }
        else{
            
            [self.titleIcon setImage:[UIImage imageNamed:@"tuli"]];
         
    
        }
        
        [_titleIcon mas_updateConstraints:^(MASConstraintMaker *make) {
          
            make.top.mas_equalTo(self.top);
            make.left.mas_equalTo(YHNormalSpace);
            //                make.centerY.mas_equalTo(self);
            make.height.mas_equalTo(60);
            make.width.mas_equalTo(YHScreen_W*0.29);
        }];
        
           //标题内容
        if (_cellData[@"titleText"] == nil) {
            self.titleLbl.text = @"标题无法获取";
        }
                                                   
        else{
            self.titleLbl.text = _cellData[@"titleText"];
            
        }
//            [_titleLbl mas_updateConstraints:^(MASConstraintMaker *make) {
//                make.top.mas_equalTo(20);
//                make.left.mas_equalTo(40);
//                make.height.mas_equalTo(40);
//               
//            }];
    
    
    }
    
    if (_cellData[@"distanceText"] == nil) {
        self.distanceLbl.text = @"距离无法获取";
    }
    else{
        self.distanceLbl.text = _cellData[@"distanceText"];
        
    }
    [_distanceLbl mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(20);
        make.right.mas_equalTo(20);
        make.height.mas_equalTo(60);
        
    }];
    if (_cellData[@"oldText"] == Nil) {
        self.oldLbl.text = @"新旧无";
    }
    else
    {
    self.oldLbl.text = _cellData[@"oldText"];
    }
    [self.oldLbl mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(60);
//        make.left.mas_equalTo(40);
//
    }];
    if (_cellData[@"colorText"] == Nil) {
        self.colorLbl.text = @"颜色无";
    }
    else{
        self.colorLbl.text = _cellData[@"colorText"];
        
    }
    [self.colorLbl mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(60);
//        make.left.mas_equalTo(40);
//        make.height.mas_equalTo(20);
//        make.width.mas_equalTo(70);
    }];
    if (_cellData[@"prudentTimeLblText"] == Nil) {
        
        self.prudentTimeLbl.text = @"无时间";
    }
    else
        
    { self.prudentTimeLbl.text = _cellData[@"prudentTimeLblText"];
    }
    
    [self.prudentTimeLbl mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(60);
//        make.left.mas_equalTo(40);
//        make.height.mas_equalTo(20);
//        make.width.mas_equalTo(70);
    }];
    
    if (_cellData[@"addressLblText"] == nil ) {
        self.addressLbl.text = @"无地址";
    }
    else{
         self.addressLbl.text = _cellData[@"addressLblText"];
    }
   
    [self.addressLbl mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(40);
//        make.left.mas_equalTo(40);
//        make.bottom.mas_equalTo(90);
    }];
}




- (UIImageView *)titleIcon{
    if (_titleIcon) {
        
         _titleIcon = [[UIImageView alloc]init];
        [self addSubview:_titleIcon];
        [_titleIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.top);
            make.left.mas_equalTo(YHNormalSpace);
            make.height.mas_equalTo(60);
            make.width.mas_equalTo(YHScreen_W*0.29);
        }];
    }
    return _titleIcon ;
    
}


- (UILabel *)titleLbl{
    if (!_titleLbl) {
        _titleLbl = [UILabel new];
//        [self addSubview:_titleLbl];
//        [_titleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
//
//        }];
    }
    return _titleLbl;
}

- (UILabel *)distanceLbl{
    if (!_distanceLbl) {
        _distanceLbl = [UILabel new];
        [self addSubview:_distanceLbl];
        [_distanceLbl mas_makeConstraints:^(MASConstraintMaker *make) {
            
        }];
    }
    return _distanceLbl;
}

- (UILabel *)oldLbl{
    if (!_oldLbl) {
        _oldLbl = [UILabel new];
        [self addSubview:_oldLbl];
        [_oldLbl mas_makeConstraints:^(MASConstraintMaker *make) {
            
        }];
    }
    return _oldLbl;
}

- (UILabel *)colorLbl{
    if (!_colorLbl) {
        _colorLbl = [UILabel new];
        [self addSubview:_colorLbl];
        [_colorLbl mas_makeConstraints:^(MASConstraintMaker *make) {
            
        }];
    }
    return _colorLbl;
}

- (UILabel *)prudentTimeLbl{
    
    if (!_prudentTimeLbl) {
        _prudentTimeLbl = [UILabel new];
        [self addSubview:_prudentTimeLbl];
        [_prudentTimeLbl mas_makeConstraints:^(MASConstraintMaker *make) {
            
        }];
    }
    return _prudentTimeLbl;
}

- (UILabel *)addressLbl{
    if (!_addressLbl) {
        _addressLbl = [UILabel new];
        [self addSubview:_addressLbl];
        [_addressLbl mas_makeConstraints:^(MASConstraintMaker *make) {
            
        }];
    }
    return _addressLbl;
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
