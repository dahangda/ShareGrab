//
//  SearchResultViewController.m
//  ShareGrab
//
//  Created by YanHang on 2017/12/21.
//  Copyright © 2017年 DH. All rights reserved.
//

#import "SearchResultViewController.h"
#import "MineTableViewCell.h"
#import "YHUIButton.h"
#define HeadViewheight  kScreenHeight*0.08
@interface SearchResultViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSUInteger btnNumber ;
    YHUIButton *selectBtn;
    
}
@end

@implementation SearchResultViewController
- (NSMutableArray *)dataTest{
    if (_dataTest == nil) {
        NSDictionary *myGrab = @{@"title_icon":@"tuli",
                                 @"titleText":@"我的挖掘机",
                                 @"distanceText":@"10km",
                                 @"oldText":@"九成新",
                                 @"colorText":@"黄色",
                                 @"prudentTimeLblText":@"一年",
                                 @"addressLblText":@"北京市石景山区苹果园一号院"
                                 ,@"pricedayLblText":@"308"
                                 };
        
        
        _dataTest = [@[myGrab,myGrab,myGrab,myGrab,myGrab,myGrab,myGrab,myGrab] mutableCopy];
    }
    
    
    return _dataTest;
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self creatUT];
}



- (void)creatUT
{
    
    UIView *heard = [[UIView alloc]initWithFrame:CGRectMake(0, -HeadViewheight, kScreenWidth, HeadViewheight)];
    
    heard.backgroundColor = [UIColor whiteColor];
    
     btnNumber = 0;
    
    YHUIButton *distanceBtn = [[YHUIButton alloc]initWithFrame:CGRectMake(heard.centerX-15-kScreenWidth/5, heard.height/3, kScreenWidth/5+10,20)];
    
    [distanceBtn.layer setMasksToBounds:YES];
    
    distanceBtn.layer.cornerRadius = 5;
    
    [distanceBtn.layer setBorderWidth:1.0];
    
    distanceBtn.layer.borderColor = YHRGBColor(73, 161, 231).CGColor;
    distanceBtn.tag  = 1;
    
    [distanceBtn setTitle:@"距离" forState:UIControlStateNormal];
    
    distanceBtn.selected = YES;
    
    [distanceBtn setImage:[UIImage imageNamed:@"33"] forState:UIControlStateSelected];
    
    
    
    distanceBtn.backgroundColor = YHRGBColor(73, 161, 231);
    
    selectBtn = distanceBtn;
    
    [distanceBtn addTarget:self action:@selector(showTag:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    YHUIButton *priceBtn = [[YHUIButton alloc]initWithFrame:CGRectMake(heard.centerX+15, heard.height/3, kScreenWidth/5+10, 20)];
    
    
    
    [priceBtn.layer setMasksToBounds:YES];
    
    priceBtn.layer.cornerRadius = 5;
    
    [priceBtn.layer setBorderWidth:1.0];
    
    priceBtn.layer.borderColor = YHRGBColor(73, 161, 231).CGColor;
    
      priceBtn.tag  = 2;
    [priceBtn setTitle:@"价格" forState:UIControlStateNormal];
    [priceBtn setTitleColor:YHRGBColor(73, 161, 231) forState:UIControlStateNormal];
    
    [priceBtn setImage:[UIImage imageNamed:@"001"] forState:UIControlStateNormal];
    
    [priceBtn addTarget:self action:@selector(showTag:) forControlEvents:UIControlEventTouchUpInside];
    
    [heard addSubview:distanceBtn];
    
    [heard addSubview:priceBtn];
    
    // table控件
    self.tableView.height = YHScreen_H - YHTabBarHeight;
    
    self.tableView.contentInset = UIEdgeInsetsMake(HeadViewheight, 0, 30, 0);
    
    self.tableView.mj_footer.hidden = YES;
    
    self.tableView.mj_header.hidden = YES;
    
    [self.tableView registerClass:[MineTableViewCell class
                                   ] forCellReuseIdentifier:@"MineTableViewCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"MineTableViewCell" bundle:nil] forCellReuseIdentifier:@"MineTableViewCell"];
    
    self.tableView.delegate = self;
    
    self.tableView.dataSource = self;
    
    [self.tableView addSubview:heard];
    
    [self.view addSubview:self.tableView];
}
#pragma mark ********************btn点击
- (void)showTag:(YHUIButton *)senter{
    
    if (senter.tag == 1) {
        
        YHLog(@"%lu",senter.tag);
        
        selectBtn.selected = NO;
        [selectBtn setImage:[UIImage imageNamed:@"001"] forState:UIControlStateNormal];
        selectBtn.backgroundColor = [UIColor whiteColor];
        [selectBtn setTitleColor:YHRGBColor(73, 161, 231) forState:UIControlStateNormal];
        
       
         senter.selected = YES;
        senter.backgroundColor = YHRGBColor(73, 161, 231);
       
        [senter setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        selectBtn = senter;
    

        
        if (btnNumber% 2) {
            [senter setImage:[UIImage imageNamed:@"11"] forState:UIControlStateSelected];
            btnNumber  =  btnNumber+ 1;
            YHLog(@"priceUP");
        }
        else{
            
            [senter setImage:[UIImage imageNamed:@"22"] forState:UIControlStateSelected];
            btnNumber  =  btnNumber + 1;
            YHLog(@"priceDown");
        }
    }
    else{
        selectBtn.selected = NO;
          [selectBtn setImage:[UIImage imageNamed:@"001"] forState:UIControlStateNormal];
        selectBtn.backgroundColor = [UIColor whiteColor];
        [selectBtn setTitleColor:YHRGBColor(73, 161, 231) forState:UIControlStateNormal];
    
        senter.selected = YES;
        senter.backgroundColor = YHRGBColor(73, 161, 231);
        [senter setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        selectBtn = senter;
        
        YHLog(@"%lu",senter.tag);
    
        if (btnNumber% 2) {
            [senter setImage:[UIImage imageNamed:@"11"] forState:UIControlStateSelected];
            btnNumber  =  btnNumber+ 1;
            YHLog(@"priceUP");
        }
        else{
          
            [senter setImage:[UIImage imageNamed:@"22"] forState:UIControlStateSelected];
            btnNumber  =  btnNumber + 1;
             YHLog(@"priceDown");
        }
        
        senter.selected = YES;
    }
    
}

#pragma mark ————— tableview 代理 —————
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return  self.dataTest.count;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return YHScreenHeight*0.2 ;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MineTableViewCell" forIndexPath:indexPath];
    cell.cellData = _dataTest[indexPath.row];
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
