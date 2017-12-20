//
//  midButton.m
//  ShareGrab
//
//  Created by YanHang on 2017/12/19.
//  Copyright © 2017年 DH. All rights reserved.
//

#import "midButton.h"

@implementation midButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat midX =self.frame.size.width/2;
    CGFloat midY =self.frame.size.height/2;
    self.titleLabel.center= CGPointMake(midX, midY +30);
    self.imageView.center=CGPointMake(midX, midY -10);
    
}



@end
