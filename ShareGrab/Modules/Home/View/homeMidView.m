//
//  homeMidView.m
//  ShareGrab
//
//  Created by YanHang on 2017/12/19.
//  Copyright © 2017年 DH. All rights reserved.
//

#import "homeMidView.h"
#import "midButton.h"
#import "HomeListDetail.h"
#import <UIButton+WebCache.h>
#import "WKViewController.h"
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

        Btn.frame = CGRectMake(self.width*0.04 + self.width*i*0.2, 20, self.width*0.12, self.height*0.38);

        
        NSString *sting = ((HomeListDetail*)_midViewDatas[i]).MenuClassLogoFileID;
        NSString *testPic = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1514198569179&di=db1c036a9ccc7126ec371317880ea520&imgtype=0&src=http%3A%2F%2Fg.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2Ffcfaaf51f3deb48fda05a714f91f3a292cf5788f.jpg";
        [Btn sd_setBackgroundImageWithURL:[NSURL URLWithString:testPic] forState:(UIControlState)normal placeholderImage:nil];
        NSString *tittle = [((HomeListDetail*)_midViewDatas[i]).MenuClassName copy];
        Btn.MenuClassType = [((HomeListDetail*)_midViewDatas[i]).MenuClassType copy];
        Btn.MenuClassLogoFileID = [((HomeListDetail*)_midViewDatas[i]).MenuClassLogoFileID copy];
        [Btn setTitle: tittle forState:UIControlStateNormal];
        Btn.titleLabel.font = YHBoldFont(12);
        [Btn setTitleColor:YHRGBColor(111, 111, 121) forState:UIControlStateNormal];
        Btn.titleLabel.numberOfLines = 0;
        [self addSubview:Btn];
        [Btn addTarget:self action:@selector(showTag:) forControlEvents:UIControlEventTouchUpInside];
        
      
    }

}
#pragma mark ********************btn跳转

- (void)showTag:(midButton *)btn
{   if( [btn.MenuClassType isEqual: @"2"])
   {
       YHLog(@"btn2");
       
       WKViewController *web = [[ WKViewController alloc]init];
       [YHAppDelegate.getCurrentVC.navigationController presentViewController:web animated:YES completion:nil];
       [self.superview.superview.viewController addChildViewController:web];

       
     }
    
    else{
        YHLog(@"btn1");
          WKViewController *web = [[ WKViewController alloc]init];
    
        [self.superview.superview.viewController presentViewController:web animated:YES completion:nil];
        
        [YHAppDelegate.getCurrentVC presentViewController:web animated:YES completion:nil];
     
       
        
    }
   
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
