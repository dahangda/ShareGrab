//
//  homeMidView.m
//  ShareGrab
//
//  Created by YanHang on 2017/12/19.
//  Copyright © 2017年 DH. All rights reserved.
//

#import "homeMidView.h"
#import "midButton.h"
@interface homeMidView()
@property (nonatomic,strong) NSMutableArray *btns;

@end
@implementation homeMidView

- (void)setMidViewDatas:(NSMutableArray *)midViewDatas{
    
    if (_midViewDatas == nil) {
        _midViewDatas = midViewDatas;
        
    }

    for (NSInteger i = 0; i < _midViewDatas.count; i++) {
        midButton *Btn =   [[midButton alloc]init];

//        [Btn mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.mas_equalTo(10);
//            make.width.mas_equalTo(YHScreen_H*0.12);
//            make.height.mas_equalTo(self.height*0.38);
//            make.centerY.mas_equalTo(self.height/3);
//            make.centerX.mas_equalTo(60+self.width/5);
////             }];
//        Btn.width = YHScreen_H*0.12;
//        Btn.height =  self.height*0.38;
        Btn.frame = CGRectMake(self.width*0.04 + self.width*i*0.2, 20, self.width*0.12, self.height*0.38);
//
        NSInteger btnNuber = i+1;
        
        NSString *BtnNberString = [NSString stringWithFormat:@"%lu",btnNuber];
        NSString *BtnTitleSting = [NSString stringWithFormat:@"%lu",btnNuber+btnNuber*10];
        [Btn setBackgroundImage:[UIImage imageNamed:_midViewDatas[i][BtnNberString]] forState:normal];
        [Btn setTitle:_midViewDatas[i][BtnTitleSting] forState:normal];
        Btn.titleLabel.font = YHBoldFont(12);
        [Btn setTitleColor:YHRGBColor(111, 111, 121) forState:UIControlStateNormal];
        Btn.titleLabel.numberOfLines = 0;
        [self addSubview:Btn];
        [Btn addTarget:self action:@selector(showTag) forControlEvents:UIControlEventTouchUpInside];
        
      
    }

}

- (void)showTag
{
    YHLog(@"midbtn");
}
//- (NSMutableArray *)btns{
//
//    if (_btns == nil) {
//        _btns = [NSMutableArray array];
//    }
//    return _btns;
//}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
