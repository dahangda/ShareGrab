//
//  AppDelegate+AppSever.m
//  ShareGrab
//
//  Created by YanHang on 2017/12/14.
//  Copyright © 2017年 DH. All rights reserved.
//

#import "AppDelegate+AppSever.h"

@implementation AppDelegate (AppSever)


#pragma mark ********************初始化窗口
- (void)initWindow
{
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    self.window.backgroundColor = YHRGBColor(236, 0, 152);
    
    
    [self.window makeKeyAndVisible];
    [[UIButton appearance] setExclusiveTouch:YES];
    [UIActivityIndicatorView appearanceWhenContainedInInstancesOfClasses:[NSArray arrayWithObjects:[MBProgressHUD class], nil]].color = YHColor;
    
}
-(UIViewController*) getCurrentVC
{
    return nil;
}
#pragma mark ********************添加通知

- (void)initNotification
{
//    [YHNotificationCenter addObserver:self selector:@selector(loginStatusChange:) name:YHNotificationLoginStatusChange object:nil];
//    [YHNotificationCenter addObserver:self selector:@selector(netWorkStatusChange:) name:YHNotificationNetWorkStateChange object:nil];
    
}

- (void)loginStatusChange:(NSNotification *)notification
{
    
    if (1) {
        
        
    }
    else
    {
    }
}

- (void)networkStatusChange:(NSNotification *)notification
{
    
}

#pragma mark ********************友盟配置

- (void)initUmeng
{
    
}

#pragma mark ********************用户启动页面显示控制

- (void)initUserStatusManager{
    /*判断用户是否有过登录（用户个人信息里面），有的话直接跳转到登录主控制器，没有的话跳转到登录控制器(通过通知)
     */
    YHTabBarViewController *vc = [YHTabBarViewController new];
    self.mainTabBarController = vc;
//    vc.view.backgroundColor = ;
    self.window.rootViewController = vc;
    
    
}

#pragma mark ********************广告显示
//- (void)adStart{
//    YHAdPagesView *adview = [[YHAdPagesView alloc] initWithFrame:YHAppWindow.bounds andTap:nil];
//    [self.window addSubview:adview];
//
//}

#pragma mark ********************定位
- (void)userLocation{
     [AMapServices sharedServices].apiKey = @"9bfefd58507caa2e84a84635ce6db5c0";
 AMapLocationManager * locationManger = [[AMapLocationManager alloc] init];
    self.manager  = locationManger;
    locationManger.delegate = self;
    //       定位超时时间，最低2s
    locationManger.locationTimeout = 2;
    //       逆地理请求超时时间，最低2s，此处设置为10s
    locationManger.reGeocodeTimeout = 2;
    
    [locationManger requestLocationWithReGeocode:YES completionBlock:^(CLLocation *location, AMapLocationReGeocode *regeocode, NSError *error) {
      struct CLLocationCoordinate2D UserLocation;
        UserLocation.latitude = location.coordinate.latitude;
        UserLocation.longitude = location.coordinate.longitude;
        YHLog(@"------%f",location.coordinate.latitude);
        YHLog(@"------%f",location.coordinate.longitude);
        CLGeocoder *geocoder = [[CLGeocoder alloc]init];
        CLLocation *alocation =[[CLLocation alloc] initWithLatitude:UserLocation.latitude longitude:UserLocation.longitude];
        [geocoder reverseGeocodeLocation:alocation completionHandler:^(NSArray *placemarks,NSError *error){
            for(CLPlacemark *placemark in placemarks)
            {
               NSString *myLocation = [NSString stringWithFormat:@"%@%@%@",placemark.locality,placemark.subLocality,placemark.name];
                YHLog(@"-----%@-----",myLocation);
                YHLog(@"-----%@----",placemarks);
            }
            
        }];
        
    }];
}
+ (AppDelegate *)shareAppDelegate{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}
@end

