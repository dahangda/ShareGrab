//
//  AppDelegate+AppSever.h
//  ShareGrab
//
//  Created by YanHang on 2017/12/14.
//  Copyright © 2017年 DH. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (AppSever)
- (void)initWindow;

- (void)initNotification;

- (void)initUmeng;

- (void)initUserStatusManager;

- (void)adStart;
- (void)userLocation;
/**
 当前顶层控制器
 */

- (UIViewController*)getCurrentVC;
- (UIViewController*)getCurrentUIVC;
//单例
+ (AppDelegate *)shareAppDelegate;
@end
