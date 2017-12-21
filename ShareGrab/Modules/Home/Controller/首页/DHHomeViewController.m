//
//  DHHomeViewController.m
//  ShareGrab
//
//  Created by YanHang on 2017/12/14.
//  Copyright © 2017年 DH. All rights reserved.
// 180 1090  680
#import "DHHomeViewController.h"
#import "JXButton.h"
#import "MineTableViewCell.h"
#import "SDCycleScrollView.h"
#import "UIButton+NMCategory.h"
#import "homeMidView.h"
#import "NetworkSingleton.h"

#define  YHHeaderHeight   (260*Iphone6ScaleWidth+YHStatusBarHeight)
#define  HeadScroViewH    (YHScreen_H - YHTabBarHeight)*0.23
#define  midViewH         (YHScreen_H - YHTabBarHeight)*0.18
@interface DHHomeViewController()<UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate>
/*1.table数据
  2.中间控件数据
   3.轮播图数据
   4.（总数据）
   5.tabbar数据
 */
@property(nonatomic,copy) NSMutableArray *dataSource;
@property(nonatomic,copy) NSMutableArray  *midData;
@property(nonatomic,copy) NSMutableArray  *headData;
@property(nonatomic,strong) NSMutableArray  *headDatainfo;
@property(nonatomic,copy) NSMutableArray  *menuData;
@end

@implementation DHHomeViewController


- (NSMutableArray *)dataSource{
    if (_dataSource == nil) {
        NSDictionary *myGrab = @{@"title_icon":@"tuli",
                                   @"titleText":@"我的挖掘机",
                                   @"distanceText":@"10km",
                                   @"oldText":@"九成新",
                                   @"colorText":@"黄色",
                                   @"prudentTimeLblText":@"一年",
                                   @"addressLblText":@"北京市石景山区苹果园一号院"
                                 ,@"pricedayLblText":@"308"
                                   };


         _dataSource = [@[myGrab,myGrab,myGrab,myGrab,myGrab,myGrab,myGrab,myGrab] mutableCopy];
    }

    return _dataSource;

}






- (void)viewDidLoad {
    [super viewDidLoad];
    
#pragma mark ********************导航栏背景图片
    
    [self.navigationController.navigationBar setBackgroundImage:
     [UIImage imageNamed:@"Back_image"] forBarMetrics:UIBarMetricsDefault];

   
#pragma mark ********************自定义扫一扫

    JXButton *leftButton = [[JXButton alloc] initWithFrame:CGRectMake(0, 7, 30, 30)];
    [leftButton setTitle:@"扫一扫" forState:0];
    [leftButton setTitleColor:YHRGBColor(255, 255, 255) forState:0];
    [leftButton setImage:[UIImage imageNamed:@"扫一扫"] forState:0];
    [leftButton setTitleColor:YHRGBColor(210, 160, 50) forState:UIControlStateSelected];
    [leftButton setImage:[UIImage imageNamed:@"扫一扫"] forState:UIControlStateSelected];
   
    [leftButton addTarget:self action:@selector(onTap) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftItem;

#pragma mark ********************添加导航搜索
 
 
    UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 0,200, 20)] ;
    titleLabel.text      = @"搜索城市， 区域"  ;
    titleLabel.textAlignment = UITextAlignmentCenter;
                                                                ;
    titleLabel.textColor = YHRGBColor(255, 255, 255);                                                      ;
    titleLabel.font  = [UIFont systemFontOfSize:14]                                           ;
   
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 25, 250, 1)];
    line.backgroundColor = YHRGBColor(255, 255, 255);
    
    UIView *conterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 260, 20)];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapView)];
    UIImageView *searchImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"搜索"]];
    searchImage.frame = CGRectMake(0,0,15,15);
    searchImage.userInteractionEnabled = YES;
    [conterView addSubview:searchImage];
    [conterView addGestureRecognizer:tap];
    [conterView addSubview:titleLabel];
    [conterView addSubview:line];
    self.navigationItem.titleView = conterView;

     [self getRequset];
   
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    //    self.navigationController.delegate = self.navigationController;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //    [self ysl_removeTransitionDelegate];
}

#pragma mark ********************网络加载

-(void) getRequset
{
    NSDictionary *parameters = @{
                                 @"ECID":ECID,
                                 @"AppID":APPID,
                                 @"AppType":@"2",
                                 @"Lat":@"39.871824",
                                 @"Lng":@"115.850858",
                                 
                                 };
    [[NetworkSingleton shareManager] httpRequest:parameters url: URL_user_home success:^(id responseBody){

    
    
        self.headData = responseBody[@"CarouselList"];
        NSLog(@"%@",responseBody);
                 self.headDatainfo = [NSMutableArray new];
        
        NSLog(@"%@",responseBody[@"Notice"]);
        
        for (NSUInteger i = 0; i<self.headData.count; i++) {

            NSString *sting;
            sting = self.headData[i][@"PicFileID"];
            [_headDatainfo addObject:sting];
            NSLog(@"%@",sting);
            
        }
        
        [self addUI];
    }
                                          failed:^(NSError *error)
     {
         NSLog(@"%@", error);
     }];
}



#pragma mark ********************添加轮播图，中间view，tabview。

- (void)addUI{
    
    // table控件
    self.tableView.height = YHScreen_H - YHTabBarHeight;
    self.tableView.contentInset = UIEdgeInsetsMake(HeadScroViewH+midViewH, 0, 30, 0);
    self.tableView.mj_footer.hidden = YES;
    self.tableView.mj_header.hidden = YES;

    [self.tableView registerClass:[MineTableViewCell class
                                   ] forCellReuseIdentifier:@"MineTableViewCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"MineTableViewCell" bundle:nil] forCellReuseIdentifier:@"MineTableViewCell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    
    //轮播控件
    SDCycleScrollView *headScroView= [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, -(HeadScroViewH+midViewH),  YHScreenWidth,HeadScroViewH) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];


    //轮播图给数据
    headScroView.imageURLStringsGroup = self.headDatainfo;
    headScroView.titlesGroup = nil;
    headScroView.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
    headScroView.backgroundColor = [UIColor blueColor];
    //中间控件
    homeMidView *midView = [[homeMidView alloc]initWithFrame:CGRectMake(0, -midViewH, YHScreenWidth, midViewH) ];
    midView.backgroundColor = [UIColor whiteColor];
    
    midView.midViewDatas = [@[@{@"1":@"1",
                                @"11":@"手机"
                                },
                            @{@"2":@"2",
                              @"22":@"单车"
                              },
                            @{@"3":@"3",
                              @"33":@"衣服"
                              },
                            @{@"4":@"4",
                              @"44":@"房屋"
                              },
                            @{@"5":@"5",
                              @"55":@"汽车"
                              }] copy];
    
    
    
     [self.tableView addSubview:headScroView];
    [self.tableView  addSubview:midView];
    
    self.tableView.backgroundView.frame = CGRectMake(0, 80, YHScreen_H, HeadScroViewH);
    [self.view addSubview:self.tableView];
  
    [self.tableView reloadData];
#pragma mark ********************添加悬浮加入我们按钮

    UIButton *btn = [[UIButton alloc] init];
    [btn setImage:[UIImage imageNamed:@"加入我们"] forState:UIControlStateNormal];
    btn.tag = 0;
    btn.layer.cornerRadius = 8;
    [btn setDragEnable:YES];
    [btn setAdsorbEnable:YES];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(showTag:) forControlEvents:UIControlEventTouchUpInside];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 50));
        YHLog(@"11111111111111111111111111111a%f",YHScreen_H);
        make.centerX.mas_equalTo(YHScreen_W*0.45);
        make.centerY.mas_equalTo(YHScreen_H*0.23);
    }];
}


-(void)showTag:(UIButton *)sender
{
    NSLog(@"button.tag >> %@",@(sender.tag));
}




#pragma mark ————— tableview 代理 —————
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
  return  self.dataSource.count;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return YHScreenHeight*0.2 ;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MineTableViewCell" forIndexPath:indexPath];
    cell.cellData = _dataSource[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            NSLog(@"点击了 我的钱包");
            break;
        case 1:
            NSLog(@"点击了 我的任务");
            break;
        case 2:
            NSLog(@"点击了 我的好友");
            break;
        case 3:
            NSLog(@"点击了 我的等级");
            break;
        default:
            break;
    }
}
#pragma mark ********************扫一扫

-(void)onTap{
    YHLog(@"点击扫一扫");
}
#pragma mark ********************搜索

- (void)tapView{
    
    YHLog(@"点击");
}
//
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
