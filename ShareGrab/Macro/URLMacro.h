//
//  URLMacro.h
//  MyApp
//
//  Created by 燕航 on 2017/10/3.
//  Copyright © 2017年 yanhang. All rights reserved.
//

#ifndef URLMacro_h
#define URLMacro_h
#define DevelopSever    1
#define TestSever       0
#define ProductSever    0

#if DevelopSever

/**开发服务器*/
#define URL_main @"http://192.168.1.86/sdsepi/"


#elif TestSever

/**测试服务器*/
#define URL_main @"http://192.168.1.86/sdsepi/"

#elif ProductSever

/**生产服务器*/
#define URL_main @"http://www.baidu.com"
#endif

#define stringformat(a,b)   [NSString stringWithFormat:@"%@%@",a,b]

#pragma mark - ——————— 详细接口地址 ————————

//测试接口
//NSString *const URL_Test = @"api/recharge/price/list";

#define URL_Home @"mapp.MShare.getHomePageInfo.hf"

#pragma mark - ——————— 用户相关 ————————
//自动登录
#define URL_user_auto_login @"/api/autoLogin"
//首页接口
#define URL_user_home      stringformat(URL_main, URL_Home)






//登录接口
#define URL_user_login      @"mapp.MShare.doUserLogin.hf"
//认证接口
#define URL_user_RealName    @"mapp.MShare.UserRealNameAuthentication.hf"
//获取验证码
#define URL_user_SMS         @"mapp.MShare.getUserTempVerifyCode.hf"
//消息系统
#define URL_user_news       @"mapp.MShare.getUserSystemNotification.hf"
//用户建议
#define URL_user_advices    @"mapp.MShare.commitUserOpinion.hf"
//关于我们
#define URL_user_abourtUs   @"mapp.MShare.getAboutUSInfo.hf"

//用户详情
#define URL_user_info_detail @"/api/user/info/detail"
//修改头像
#define URL_user_info_change_photo @"/api/user/info/changephoto"
//注释
#define URL_user_info_change @"/api/user/info/change"
//--------------------------设置------------------------------
/**86服务器*/
#define ECID @"100123"
#define APPID  @"26"
/**线上服务器*/
//#define ECID @"100001"
//#define APPID  @"20"
#define OwnerECID @"100102"
#define GOODSSNID @"10000024"
#define kGtAppId           @"2gEoTK2fu69EY0QKn7Heu8"
#define kGtAppKey          @"EBJJBGE2gp57opfzjsW628"
#define kGtAppSecret       @"TKz8CD1aIo88JmK0Ca5512"
//车主端高德地图key
#define kGaoDeMap          @"8c14886b69c26f16e393437224fc2970"
//用户端高德地图key
#define gaodeKey           @"1a4d4290547ab065d020f0ea486de241"

#endif /* URLMacro_h */
