//
//  AppDelegate.h
//  ShareGrab
//
//  Created by YanHang on 2017/12/14.
//  Copyright © 2017年 DH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YHTabBarViewController.h"
#import <AMapLocationKit/AMapLocationKit.h>
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
/** 主要控制器 **/
@property(nonatomic,strong) YHTabBarViewController * mainTabBarController;
@property (nonatomic, strong)AMapLocationManager *manager;
@end

