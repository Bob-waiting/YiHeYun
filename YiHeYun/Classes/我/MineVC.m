//
//  MineVC.m
//  YiHeYun
//
//  Created by mac on 2017/3/8.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "MineVC.h"

@interface MineVC ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *performSegues;

@end

@implementation MineVC

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];

  self.navBar.hidden = YES;
}

- (void)viewDidLoad {
  [super viewDidLoad];

  self.navBar.hidden = YES;
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
  if (section == 0) {
    return 1;
  } else if (section == 1) {
    return 2;
  } else{
    return 5;
  }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 3;
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

  if (indexPath.section==0&&indexPath.row==0) {

    UIImageView *iconImage = [[UIImageView alloc]initWithFrame:CGRectMake(16, 3, 38, 38)];
    iconImage.layer.cornerRadius = 19;
    iconImage.layer.masksToBounds = YES;
    iconImage.backgroundColor = [UIColor grayColor];
    [cell.contentView addSubview:iconImage];

    UILabel *nameLab = [[UILabel alloc]initWithFrame:CGRectMake(60, 12, 100, 20)];
    nameLab.text = @"石红薯";
    nameLab.font = [UIFont systemFontOfSize:15];
    [cell.contentView addSubview:nameLab];

    UILabel *phoneLab = [[UILabel alloc]initWithFrame:CGRectMake(160, 12, 120, 20)];
    phoneLab.text = @"137****8888";
    phoneLab.font = [UIFont systemFontOfSize:15];
    [cell.contentView addSubview:phoneLab];

  } else if (indexPath.section==1&&indexPath.row==0) {

    UILabel *stateLab = [[UILabel alloc]initWithFrame:CGRectMake(100, 12, WIDTH-130, 20)];
    stateLab.text = @"未佩戴／离线／剩余电量88%";
    stateLab.font = [UIFont systemFontOfSize:15];
    stateLab.textAlignment = NSTextAlignmentRight;
    [cell.contentView addSubview:stateLab];

    cell.textLabel.text = @"智能水表";

  } else if (indexPath.section==1&&indexPath.row==1) {
    UIButton *addCaseBtn = [[UIButton alloc]initWithFrame:CGRectMake(30, 10, WIDTH-60, 40)];
    //        [addCaseBtn setBackgroundImage:[UIImage imageNamed:@"icon-通用按钮"] forState:UIControlStateNormal];
    [addCaseBtn setTitle:@"添加病历" forState:UIControlStateNormal];
    [addCaseBtn setTitleColor:[UIColor colorWithRed:126/255.0 green:53/255.0 blue:150/255.0 alpha:1] forState:UIControlStateNormal];
      [addCaseBtn addTarget:self action:@selector(doClick_addCase:) forControlEvents:UIControlEventTouchUpInside];
    addCaseBtn.layer.borderWidth = 1;
    addCaseBtn.layer.borderColor = [UIColor colorWithRed:126/255.0 green:53/255.0 blue:150/255.0 alpha:1].CGColor;
    addCaseBtn.layer.cornerRadius = 20;
    addCaseBtn.layer.masksToBounds = true;

    [cell.contentView addSubview:addCaseBtn];

    cell.accessoryType = UITableViewCellAccessoryNone;
  } else {

    switch (indexPath.row) {
      case 0:
        cell.textLabel.text = @"健康档案";
        break;
      case 1:
      {
        UILabel *friendsLab = [[UILabel alloc]initWithFrame:CGRectMake(100, 12, WIDTH-130, 20)];
        friendsLab.text = @"2人";
        friendsLab.font = [UIFont systemFontOfSize:15];
        friendsLab.textAlignment = NSTextAlignmentRight;
        [cell.contentView addSubview:friendsLab];

        cell.textLabel.text = @"朋友";
      }
        break;
      case 2:
        cell.textLabel.text = @"设置";
        break;
      case 3:
      {
        UILabel *phoneLab = [[UILabel alloc]initWithFrame:CGRectMake(100, 12, WIDTH-130, 20)];
        phoneLab.text = @"010-89441121234";
        phoneLab.font = [UIFont systemFontOfSize:15];
        phoneLab.textAlignment = NSTextAlignmentRight;
        [cell.contentView addSubview:phoneLab];

        cell.textLabel.text = @"联系我们";
      }
        break;
      case 4:
        cell.textLabel.text = @"意见反馈";
        break;

      default:
        break;
    }

  }

  return cell;
}

-(void)doClick_addCase:(id)sender
{
    [self performSegueWithIdentifier:@"addCase" sender:nil];
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
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
  NSArray *headerArr = @[@"健康管家",@"我的设备",@""];
  UIView *view = [[UIView alloc]init];
  view.backgroundColor = [UIColor colorWithRed:232/255.0 green:234/255.0 blue:235/255.0 alpha:1];

  UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(16, 0, 300, 40)];
  label.text = [NSString stringWithFormat:@"%@",headerArr[section]];
  label.font = [UIFont systemFontOfSize:15];
  [view addSubview:label];
  return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  if (indexPath.section == 1&&indexPath.row == 1) {
    return 60;
  }

  return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  if (indexPath.section == 0) {

  } else if (indexPath.section == 1) {
    if (indexPath.row == 0) {

    } else if (indexPath.row == 1) {

    } else {

    }
  } else if (indexPath.section == 2) {
    [self performSegueWithIdentifier:self.performSegues[indexPath.row] sender:nil];
  }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

  UIViewController *destinatVC = segue.destinationViewController;
  destinatVC.hidesBottomBarWhenPushed = true;
  destinatVC.navigationController.navigationBar.hidden = false;
}

-(NSArray *)performSegues {
  if (!_performSegues) {
    _performSegues = @[@"healthRecordSegue",@"friendsSegue",@"settingSegue",@"contactUsSegue",@"feedbackSegue"];
  }
  return _performSegues;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
  return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


@end
