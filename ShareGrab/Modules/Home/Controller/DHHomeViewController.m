//
//  DHHomeViewController.m
//  ShareGrab
//
//  Created by YanHang on 2017/12/14.
//  Copyright © 2017年 DH. All rights reserved.
//

#import "DHHomeViewController.h"
#import "JXButton.h"
#import "MeTableViewCell.h"
#define  YHHeaderHeight   (260*Iphone6ScaleWidth+YHStatusBarHeight)
@interface DHHomeViewController()<UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate>
@property(nonatomic,strong) SDCycleScrollView * scroView;
@property(nonatomic,strong) UIView *midView;
@property(nonatomic,copy) NSMutableArray *dataSource;
@property(nonatomic,strong)UIView *lowView;
@end

@implementation DHHomeViewController
- (NSMutableArray *)dataSource{
    if (_dataSource == nil) {
        NSDictionary *myWallet = @{@"titleText":@"我的钱包",@"clickSelector":@"",@"title_icon":@"qianb",@"detailText":@"10.00",@"arrow_icon":@"arrow_icon"};
        NSDictionary *myMission = @{@"titleText":@"我的任务",@"clickSelector":@"",@"title_icon":@"renw",@"arrow_icon":@"arrow_icon"};
        NSDictionary *myFriends = @{@"titleText":@"我的好友",@"clickSelector":@"",@"title_icon":@"haoy",@"arrow_icon":@"arrow_icon"};
        NSDictionary *myLevel = @{@"titleText":@"我的等级",@"clickSelector":@"",@"title_icon":@"dengji",@"detailText":@"LV10",@"arrow_icon":@"arrow_icon"};
         _dataSource = @[myWallet,myMission,myFriends,myLevel];
    }
    return _dataSource;
}

- (UIView *)midView{
    
    if (_midView == nil) {
        _midView = [[UIView alloc]initWithFrame:CGRectMake(0, YHHeaderHeight-35, YHScreenWidth, 80)];
        _midView.backgroundColor = [UIColor redColor];
    }
    return  _midView ;
}

- (UIView *)lowView{
    if (_lowView == nil) {
        _lowView = [[UIView alloc]initWithFrame:CGRectMake(0, YHHeaderHeight+50, YHScreenWidth , 210)];
        self.tableView.mj_header.hidden = YES;
        self.tableView.mj_footer.hidden = YES;
        [self.tableView registerClass:[MeTableViewCell class] forCellReuseIdentifier:@"MeTableViewCell"];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        [_lowView addSubview:self.tableView];
        _lowView.backgroundColor = [UIColor greenColor];
    }
    return _lowView;
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


    UILabel * titleLabel               = [[UILabel alloc]initWithFrame:CGRectMake(20, 0,200, 20)] ;
    titleLabel.text                        = @"搜索城市， 区域"                                                                        ;
    titleLabel.textAlignment = UITextAlignmentCenter;
    titleLabel.backgroundColor  = [UIColor blueColor]                                                             ;
    titleLabel.textColor = YHColor;                                                      ;
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
  
    
    
//
//    SDCycleScrollView *VC = [[SDCycleScrollView alloc] initWithFrame:CGRectMake(0, 0, YHScreenWidth, YHHeaderHeight-40)];
     SDCycleScrollView *_scroView   = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, YHScreenWidth, YHHeaderHeight-40) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    _scroView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    _scroView.titlesGroup = nil;
    //    titles;
    _scroView.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
    self.scroView.backgroundColor = [UIColor blueColor];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _scroView.imageURLStringsGroup = self.imagesURLStrings;
    });
    [self.view addSubview:_scroView];
    [self.view addSubview:self.midView];
    [self.view addSubview:self.lowView];
  
    [self.tableView reloadData];

}


#pragma mark ————— tableview 代理 —————
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
  return  self.dataSource.count;
    YHLog(@"%d",self.dataSource.count);
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50.0f;
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
