//
//  YHUIButton.m
//  ShareGrab
//
//  Created by YanHang on 2017/12/21.
//  Copyright © 2017年 DH. All rights reserved.
//

#import "YHUIButton.h"

@implementation YHUIButton
- (void)layoutSubviews {
    [super layoutSubviews];
    
    //    // Center image
    //    CGPoint center = self.imageView.center;
    //    center.x = self.frame.size.width/2;
    //    center.y = self.imageView.frame.size.height/2 + 13;
    //    self.imageView.center = center;
    //
    //    //    self.imageView.height = 27.0;
    //    //    self.imageView.width = 28.0;
    //
    //    //Center text
    //    CGRect newFrame = [self titleLabel].frame;
    //    newFrame.origin.x = 0;
    //    newFrame.origin.y = CGRectGetMaxY(self.imageView.frame) + 5;
    //    newFrame.size.width = self.frame.size.width;
    //
    //    self.titleLabel.frame = newFrame;
    //    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    CGRect titleF = self.titleLabel.frame;
    CGRect imageF = self.imageView.frame;
    
    titleF.origin.x = 0;
    self.titleLabel.frame = titleF;
    
    imageF.origin.x = CGRectGetMaxX(titleF) + 10;
    self.imageView.frame = imageF;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
