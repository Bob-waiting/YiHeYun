//
//  FriendInfoVC.m
//  YiHeYun
//
//  Created by Ink on 2017/4/2.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "FriendInfoVC.h"
#import "EditVC.h"
#import "UIImage+Color.h"

@interface FriendInfoVC ()<UITableViewDataSource , UITableViewDelegate , EditVCDeleget>

@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation FriendInfoVC

- (void)viewDidLoad {
  [super viewDidLoad];
  [self.navBar setBackgroundImage:[UIImage imageWithColor:AEColor(126, 53, 150, 1)] forBarMetrics:0];
  self.navBar.shadowImage=[UIImage new];
  [self.navBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];

  self.title  = @"朋友";

  self.dataSource = @[@{@"title":@"备注名", @"message":@"同学"},
                      @{@"title":@"手机号",  @"message":@"137****7777"}];
  [self creatTableView];
}

- (void)relieveAction {
  
}

#pragma mark -EditVC保存返回后的代理
-(void)endEditMeInfo:(NSString *)info andInRow:(NSInteger)row{

}

- (void)creatTableView
{
  UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-50) style:UITableViewStylePlain];
  tableView.dataSource = self;
  tableView.delegate = self;
  tableView.backgroundColor = [UIColor clearColor];
  [self.view addSubview:tableView];

  UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, WIDTH/1.8)];
  headerView.backgroundColor = [UIColor colorWithRed:126/255.0 green:53/255.0 blue:150/255.0 alpha:1];
  tableView.tableHeaderView = headerView;

  UILabel *mineLab = [[UILabel alloc]initWithFrame:CGRectMake((WIDTH-20)/2, 20, 20, 20)];
  mineLab.text = @"我";
  mineLab.textColor = [UIColor whiteColor];
  mineLab.font = [UIFont systemFontOfSize:18];
  [headerView addSubview:mineLab];

  UIImageView *mineImage = [[UIImageView alloc]initWithFrame:CGRectMake((WIDTH-50)/2, (WIDTH/1.8-50)/2, 50, 50)];
  mineImage.layer.cornerRadius = 25;
  mineImage.layer.masksToBounds = YES;
  mineImage.backgroundColor = [UIColor whiteColor];
  [headerView addSubview:mineImage];

  UILabel *mineNameLab = [[UILabel alloc]initWithFrame:CGRectMake((WIDTH-120)/2, CGRectGetMaxY(mineImage.frame)+10, 120, 40)];
  mineNameLab.text = @"李玲玲";
  mineNameLab.textColor = [UIColor whiteColor];
  mineNameLab.textAlignment = NSTextAlignmentCenter;
  mineNameLab.font = [UIFont systemFontOfSize:30];
  [headerView addSubview:mineNameLab];

  UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 106)];
  footerView.backgroundColor = [UIColor clearColor];
  tableView.tableFooterView = footerView;

  UIButton *relieveButton = [[UIButton alloc] initWithFrame:CGRectMake(35, 50, WIDTH - 70, 56)];
  [relieveButton setTitle:@"解除关注" forState:UIControlStateNormal];
  [relieveButton addTarget:self action:@selector(relieveAction) forControlEvents:UIControlEventTouchUpInside];
  [relieveButton setBackgroundColor:AEColor(126, 53, 150, 1)];
  relieveButton.layer.cornerRadius = 28;
  relieveButton.layer.masksToBounds= true;
  [footerView addSubview:relieveButton];
}

#pragma mark -UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  UITableViewCell *cell =nil;
  static NSString *identifer = @"cell";
  cell = [tableView dequeueReusableCellWithIdentifier:identifer];
  if (! cell) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifer];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
  }

  cell.textLabel.font = [UIFont systemFontOfSize:15];
  cell.textLabel.text = self.dataSource[indexPath.row][@"title"];
  cell.detailTextLabel.text = self.dataSource[indexPath.row][@"message"];

  return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

  return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  switch (indexPath.row) {
    case 0: case 1: {
//      EditVC *vc=[[EditVC alloc]init];
//      vc.delegate=self;
//      vc.row=indexPath.row;
//      [self.navigationController pushViewController:vc animated:YES];
    }
      break;

    default:
      break;
  }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
