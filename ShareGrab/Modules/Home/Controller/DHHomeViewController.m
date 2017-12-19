//
//  DHHomeViewController.m
//  ShareGrab
//
//  Created by YanHang on 2017/12/14.
//  Copyright © 2017年 DH. All rights reserved.
// 180 1090  680
#import "DHHomeViewController.h"
#import "JXButton.h"
#import "MeTableViewCell.h"
#import "SDCycleScrollView.h"
#import "UIButton+NMCategory.h"

#define  YHHeaderHeight   (260*Iphone6ScaleWidth+YHStatusBarHeight)
#define  HeadScroViewH    (YHScreen_H - YHTabBarHeight)*0.23
#define  midViewH         (YHScreen_H - YHTabBarHeight)*0.2
@interface DHHomeViewController()<UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate>

@property(nonatomic,copy) NSMutableArray *dataSource;

@end

@implementation DHHomeViewController

- (NSMutableArray *)dataSource{
    if (_dataSource == nil) {
        NSDictionary *myWallet = @{@"titleText":@"我的钱包",@"clickSelector":@"",@"title_icon":@"qianb",@"detailText":@"10.00",@"arrow_icon":@"arrow_icon"};
        NSDictionary *myMission = @{@"titleText":@"我的任务",@"clickSelector":@"",@"title_icon":@"renw",@"arrow_icon":@"arrow_icon"};
        NSDictionary *myFriends = @{@"titleText":@"我的好友",@"clickSelector":@"",@"title_icon":@"haoy",@"arrow_icon":@"arrow_icon"};
        NSDictionary *myLevel = @{@"titleText":@"我的等级",@"clickSelector":@"",@"title_icon":@"dengji",@"detailText":@"LV10",@"arrow_icon":@"arrow_icon"};
         _dataSource = @[myWallet,myMission,myFriends,myLevel,myWallet,myMission,myFriends,myLevel];
    }
    return _dataSource;
}






- (NSMutableArray *)imagesURLStrings{
    if (_imagesURLStrings == nil) {
        _imagesURLStrings = @[
                              @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                              @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                              @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
                              ];
    }
    return  _imagesURLStrings;
    
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
    titleLabel.font  = [UIFont systemFontOfSize:12]                                           ;
   
    
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
    
  
  [self addUI];
  
    
   
}

#pragma mark ********************添加轮播图，中间view，tabview。

- (void)addUI{
    

    
    
    self.tableView.height = YHScreen_H - YHTabBarHeight;
    self.tableView.contentInset = UIEdgeInsetsMake(HeadScroViewH+midViewH, 0, 0, 0);
    self.tableView.mj_footer.hidden = YES;
    self.tableView.mj_header.hidden = YES;
    [self.tableView registerClass:[MeTableViewCell class
                                   ] forCellReuseIdentifier:@"MeTableViewCell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    SDCycleScrollView *headScroView= [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, -(HeadScroViewH+midViewH),  YHScreenWidth,HeadScroViewH) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    //headScroView  = SDCycleScrollViewPageContolAlimentRight;
    headScroView.imageURLStringsGroup = @[
                                           @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                                           @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                                           @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg",@"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
                                           ];
    headScroView.titlesGroup = nil;
    headScroView.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
    headScroView.backgroundColor = [UIColor blueColor];
    
    UIView *midView = [[UIView alloc]initWithFrame:CGRectMake(0, -midViewH, YHScreenWidth, midViewH) ];
    midView.backgroundColor = [UIColor redColor];
    
     [self.tableView addSubview:headScroView];
    [self.tableView  addSubview:midView];
    
    //    UIImageView *backGroudView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Back_image"]];
    //    backGroudView.frame = CGRectMake(0, 80, YHScreen_H, HeadScroViewH);
    //    self.tableView.backgroundView = backGroudView;
    
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
    YHLog(@"%d",self.dataSource.count);
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100.0f;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MeTableViewCell" forIndexPath:indexPath];
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
