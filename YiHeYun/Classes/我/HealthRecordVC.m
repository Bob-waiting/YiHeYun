//
//  HealthRecordVC.m
//  YiHeYun
//
//  Created by Ink on 2017/3/28.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "HealthRecordVC.h"
#import "UIImage+Color.h"

@interface HealthRecordVC ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation HealthRecordVC

- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = @"健康档案";

  [self.navBar setBackgroundImage:[UIImage imageWithColor:AEColor(126, 53, 150, 1)] forBarMetrics:0];
  self.navBar.shadowImage=[UIImage new];
  [self.navBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];

  [self creatTableView];
}

- (void)creatTableView
{
  UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-50) style:UITableViewStylePlain];
  tableView.dataSource = self;
  tableView.delegate = self;
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
}

#pragma mark -UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  UITableViewCell *cell =nil;
  static NSString *identifer = @"cell";
  cell = [tableView dequeueReusableCellWithIdentifier:identifer];
  if (! cell) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
  }

  cell.textLabel.font = [UIFont systemFontOfSize:15];


  return cell;
}

#pragma mark -UITableViewDelegate
//组头部的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
  if (section == 2) {
    return 20;
  } else {
    return 40;
  }
}
//设置表头视图内容
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
  return @"title";
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

  return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
