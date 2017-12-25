//
//  midButton.h
//  ShareGrab
//
//  Created by YanHang on 2017/12/19.
//  Copyright © 2017年 DH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIButton+WebCache.h"
#import "UIImageView+WebCache.h"

@interface midButton : UIButton
/**页面类型  **/
@property(nonatomic,strong) NSString * MenuClassType;
/** 跳转链接 **/
@property(nonatomic,strong) NSString * MenuClassLogoFileID;
@end
