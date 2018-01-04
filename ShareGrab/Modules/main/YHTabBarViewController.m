//
//  YHTabBarViewController.m
//  MyApp
//
//  Created by 燕航 on 2017/10/8.
//  Copyright © 2017年 yanhang. All rights reserved.
//

#import "YHTabBarViewController.h"
#import "YHTabBar.h"
#import "DHHomeViewController.h"
#import "DHFindHouserViewController.h"
#import "DHMessageViewController.h"
#import "DHMineViewController.h"
#import "NetworkSingleton.h"
#import "HomeListDetail.h"


@interface YHTabBarViewController ()<YHTabBarDelegate>
/** 存放子控制器的数组 */
//
@property(nonatomic,strong) NSMutableArray * Controllers;
@property(nonatomic,strong) NSDictionary  *itemDatas;
@property(nonatomic,strong) HomeListDetail *homeListDTL;
@end

@implementation YHTabBarViewController

- (void)viewDidLoad {
 
    [super viewDidLoad];
    [self loadingitemDatas];
    [self setupControllers];
    [self setupAndConfigTabBar];
    
    
    
    // Do any additional setup after loading the view.
}



-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
       [self removeOriginControls];
}



#pragma mark ————— 取出系统自带的tabbar并把里面的按钮删除掉 —————
- (void)removeOriginControls {
    
    [self.tabBar.subviews enumerateObjectsUsingBlock:^(__kindof UIView * obj, NSUInteger idx, BOOL * stop) {
        
        if ([obj isKindOfClass:[UIControl class]]) {
            
            [obj removeFromSuperview];
        }
    }];
}




#pragma mark ********************配置自定义tabbar
- (void)configTabBar{
    self.TabBar.itmeCount = _Controllers.count;
    
    [self.Controllers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        UIViewController *VC = (UIViewController *)obj;
        //配置图片的渲染模式
//       UIImage *selectedImage = VC.tabBarItem.selectedImage;
//        VC.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

        
        [self.TabBar addTabBarItem:VC.tabBarItem];
        YHLog(@"%id",VC.tabBarItem);
    }];
    
}



#pragma mark ********************装载控制器携带各个信息tabBaritem

-(void)setupControllers
{
    _Controllers = [[NSMutableArray alloc]init];
    
    DHHomeViewController *homeVC = [[DHHomeViewController alloc]init];
    [self  configChildContrller:homeVC tittile:_homeListDTL.NavigationName1 tabBarItemImage:(NSString *)_homeListDTL.NavigationLogoPic1 itemSelImage:@"home_highlight"];
 //home_highlight home_normal
    DHFindHouserViewController *findHourseVC = [[DHFindHouserViewController alloc]init];
    [self configChildContrller:(UIViewController *)findHourseVC tittile:_homeListDTL.NavigationName2 tabBarItemImage:_homeListDTL.NavigationLogoPic2 itemSelImage:@"tabbar_icon_find_highlight"];
    
    DHMessageViewController *messageVC = [[DHMessageViewController alloc]init];
    [self configChildContrller:messageVC tittile:_homeListDTL.NavigationName3 tabBarItemImage:_homeListDTL.NavigationLogoPic3 itemSelImage:@"tabBar_Message_icon"];
    
    DHMineViewController *meVC = [[DHMineViewController alloc]init];
    [self configChildContrller:meVC tittile:_homeListDTL.NavigationName4 tabBarItemImage:_homeListDTL.NavigationLogoPic4 itemSelImage:@"tabbar_icon_me_highlight"];
    
    

}

#pragma mark ********************配置子控制器的tabItem显示

- (void)configChildContrller:(UIViewController *)vc tittile:(NSString *)tittle tabBarItemImage:(NSString *)imageName itemSelImage:(NSString *)selName
{
    vc.tabBarItem.title = tittle;//跟上面一样效果
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    
   UIImage *selimage =  [[UIImage imageNamed:selName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = selimage;
    [_Controllers addObject:vc];
    //包装导航控制器
    vc.title = tittle;
   
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    [nav.navigationBar setBarTintColor:YHRGBColor(67, 166, 235)];
    
    [self addChildViewController:nav];
}




#pragma mark ********************装载tabBar

- (void)setupAndConfigTabBar
{
    
    YHTabBar *YHtabBar = [[YHTabBar alloc]init];
    YHtabBar.frame = self.tabBar.bounds;
//    YHtabBar.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1];
    [YHtabBar addImageView];
    YHtabBar.delegate = self;
    _TabBar = YHtabBar;
    self.TabBar.itemImageRatio = 0.7;
    self.TabBar.itemTitleFont          = YHSYSTEMFONT(9);
    self.TabBar.itemTitleColor         = YHRGBColor(255, 255, 255);
   self.TabBar.selectedItemTitleColor =YHRGBColor(136,198,240);
    [self.tabBar addSubview:YHtabBar];
    [self configTabBar];
   
}


- (void)ChangeSelectIndexFrom:(NSInteger)from to:(NSInteger)to

{
  YHTabBarItem *selectItem = self.TabBar.items[to-1];
    YHTabBarItem *fromItem = self.TabBar.items[from -1];
    selectItem.userInteractionEnabled = NO;
    fromItem.userInteractionEnabled = YES;
    self.selectedIndex = to-1;
    
}


- (void)loadingitemDatas
{

    NSDictionary *parameters = @{
                                 @"ECID":ECID,
                                 @"AppID":APPID,
                                 @"AppType":@"2",
                                 @"Lat":@"39.871824",
                                 @"Lng":@"115.850858",
                                 
                                 };
    [[NetworkSingleton shareManager] httpRequest:parameters url: URL_user_home success:^(id responseBody){

        self.itemDatas = responseBody[@"HomeList"];
        self.homeListDTL =  [HomeListDetail mj_objectWithKeyValues:_itemDatas];
        
//        NSLog(@"%@",responseBody);
//        NSMutableArray *headDataArryInfo = [NSMutableArray array];
//        for (NSInteger i = 0;i < self.headData.count ; i++) {
//            carourelListDetail * caroureListDT =  [carourelListDetail mj_objectWithKeyValues:self.headData[i] ];
//            [headDataArryInfo addObject:caroureListDT.PicFileID];
//
//        }
//
//
//
//        NSMutableArray *picUrls = [NSMutableArray new];
//        for (NSInteger i = 0; i < self.headData.count; i ++ ) {
//            [picUrls addObject: [NSURL URLWithString: headDataArryInfo[i]]];
//        }
//
//
//        self.headView.imageURLStringsGroup = picUrls;
//
//
//        self.headView.titlesGroup = nil;
//        self.headView.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
//        self.headView.backgroundColor = [UIColor blueColor];
//
//#pragma mark ********************midView数据
//
//        self.midData  = responseBody[@"HomeList"];
//        NSMutableArray *homeListDTs = [NSMutableArray array];
//        for (NSUInteger i = 0; i < self.midData.count; i++) {
//            HomeListDetail *homeListDT =  [HomeListDetail mj_objectWithKeyValues:self.midData[i] ];
//            [homeListDTs addObject:homeListDT];
//
//        }
//        self.midView.midViewDatas = homeListDTs;
//#pragma mark ********************table数据
//        self.dataSource = responseBody[@"GoodsList"];
//        NSMutableArray *GoodsListDTs = [NSMutableArray array];
//        for (NSUInteger i = 0; i < self.dataSource.count; i++) {
//            GoodListDetail *GoodsListDT =  [GoodListDetail mj_objectWithKeyValues:self.dataSource[i] ];
//            [GoodsListDTs addObject:GoodsListDT];
//
//        }
//        self.dataSourceinfo = GoodsListDTs;
//
//        dispatch_async(dispatch_get_main_queue(), ^{
//
//
//
//            [self.tableView reloadData];
//        });
//
    }failed:^(NSError *error)
     {
         NSLog(@"%@", error);
     }];
//
//
//
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
