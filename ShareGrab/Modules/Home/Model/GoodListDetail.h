//
//  GoodListDetail.h
//  ShareGrab
//
//  Created by YanHang on 2017/12/25.
//  Copyright © 2017年 DH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoodListDetail : NSObject
/*
 1.商品id
 2.商品类型
 3.商品图片名字
 4.商品价格
 5，经度
 6.商品图片地址
 
 **
 */

@property(nonatomic,copy) NSString *  GoodsSNID;
@property(nonatomic,copy) NSString *  BusinessType;
@property(nonatomic,copy) NSString *  Distance;
@property(nonatomic,copy) NSString *  GoodsTypePicFileID;
@property(nonatomic,copy) NSString *  GoodsUsePrice;
@property(nonatomic,copy) NSString *  Lat;
@property(nonatomic,copy) NSString *  GoodsPic;
@property(nonatomic,copy) NSString *  Unit;
@property(nonatomic,copy) NSString *  GoodsName;
@property(nonatomic,copy) NSString *  Lng;
@property(nonatomic,copy) NSString *  Status;
@property(nonatomic,copy) NSString *  GoodsDeposit;
@property(nonatomic,copy) NSString *  GoodsTypeID;
@property(nonatomic,copy) NSString *  Address;
@property(nonatomic,copy)NSString * LabelContent;
@end
