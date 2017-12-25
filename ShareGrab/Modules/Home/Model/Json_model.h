//
//  Json_model.h
//  ShareGrab
//
//  Created by YanHang on 2017/12/20.
//  Copyright © 2017年 DH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "carourelListDetail.h"

@interface Json_model : NSObject
@property (nonatomic,assign) BOOL Result;
@property(nonatomic,strong) NSMutableArray * CarouselList;
@property(nonatomic,copy) NSString *  Notice;
@property(nonatomic,strong) NSMutableArray * GoodsList;
@property(nonatomic,strong) NSMutableArray * HomeList;

@end
