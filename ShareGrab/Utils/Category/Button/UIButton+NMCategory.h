//
//  UIButton+NMCategory.h
//  DragButtonDemo
//
//  Created by Aster0id on 14-5-16.
//
//

#import <UIKit/UIKit.h>

@interface UIButton (NMCategory)

@property(nonatomic,assign,getter = isDragEnable)   BOOL dragEnable;
@property(nonatomic,assign,getter = isAdsorbEnable) BOOL adsorbEnable;

@end
#pragma mark ********************使用例子

//UIButton *btn = [[UIButton alloc] init];
//[btn setImage:[UIImage imageNamed:@"加入我们"] forState:UIControlStateNormal];
//btn.tag = 0;
//btn.layer.cornerRadius = 8;
//[btn setDragEnable:YES];
//[btn setAdsorbEnable:YES];
//[self.view addSubview:btn];
//[btn addTarget:self action:@selector(showTag:) forControlEvents:UIControlEventTouchUpInside];
//
//[btn mas_makeConstraints:^(MASConstraintMaker *make) {
//    make.size.mas_equalTo(CGSizeMake(50, 50));
//    YHLog(@"11111111111111111111111111111a%f",YHScreen_H);
//    make.centerX.mas_equalTo(YHScreen_W*0.45);
//    make.centerY.mas_equalTo(YHScreen_H*0.23);
//}];

//    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(5, 200,60, 60)];
//    btn1.backgroundColor = [UIColor blackColor];
//    btn1.tag = 1;
//    btn1.layer.cornerRadius = 8;
//    [btn1 setDragEnable:YES];
//    [btn1 setAdsorbEnable:NO];
//    [self.view addSubview:btn1];
//    [btn1 addTarget:self action:@selector(showTag:) forControlEvents:UIControlEventTouchUpInside];

