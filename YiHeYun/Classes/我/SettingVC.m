//
//  SettingVC.m
//  YiHeYun
//
//  Created by Ink on 2017/3/28.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "SettingVC.h"
#import "SetPswVC.h"
#import "UIButton+Extension.h"


@interface SettingVC ()<UITableViewDataSource, UITableViewDelegate>
{
  UIView *shreMaskView;
  UIView *pickweBgView;
}

@property (nonatomic, strong) NSArray *sharPickerSource;
@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation SettingVC

- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = @"设置";

  [self creatTableView];
}

-(void)logoutAction {
  // @TODO: logout

}

- (void) showSharePickerView {
  shreMaskView = [[UIView alloc] init];
  [self.view addSubview:shreMaskView];
  [shreMaskView alignToView:self.view];
  shreMaskView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
  UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideSharePickerView)];
  [shreMaskView addGestureRecognizer:tap];

  pickweBgView = [[UIView alloc] init];
  [shreMaskView addSubview:pickweBgView];

  [pickweBgView alignBottomEdgeWithView:shreMaskView predicate:@"0"];
  [pickweBgView alignLeading:@"0" trailing:@"0" toView:shreMaskView];
  [pickweBgView constrainHeight:@"205"];
  pickweBgView.backgroundColor = [UIColor whiteColor];

  UILabel *titleLabel = [[UILabel alloc] init];
  [pickweBgView addSubview:titleLabel];
  [titleLabel alignLeading:@"0" trailing:@"0" toView:pickweBgView];
  [titleLabel alignTopEdgeWithView:pickweBgView predicate:@"0"];
  [titleLabel constrainHeight:@"60"];
  titleLabel.text = @"分享到";
  titleLabel.textColor = [UIColor blackColor];
  titleLabel.textAlignment = NSTextAlignmentCenter;

  UIView *splitLine = [[UIView alloc] init];
  [pickweBgView addSubview:splitLine];
  [splitLine constrainTopSpaceToView:titleLabel predicate:@"0"];
  [splitLine alignCenterXWithView:pickweBgView predicate:@"0"];
  [splitLine constrainHeight:@"0.5"];
  [splitLine alignLeading:@"15" trailing:@"-15" toView:pickweBgView];
  splitLine.backgroundColor = [UIColor lightGrayColor];

  UIStackView *pickerStackView = [[UIStackView alloc] init];
  [pickweBgView addSubview:pickerStackView];
  [pickerStackView alignCenterXWithView:pickweBgView predicate:@"0"];
  [pickerStackView alignCenterYWithView:pickweBgView predicate:@"30"];
  [pickerStackView setAxis:UILayoutConstraintAxisHorizontal];
  [pickerStackView setSpacing:35];

  for (int index = 0; index < self.sharPickerSource.count; index++) {
    UIButton *shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [pickerStackView addArrangedSubview: shareButton];

    [shareButton constrainWidth:@"60" height:@"75"];
    [shareButton setImage:[UIImage imageNamed: self.sharPickerSource[index][@"imageName"]] forState:UIControlStateNormal];
    [shareButton setTitle:self.sharPickerSource[index][@"title"] forState:UIControlStateNormal];
    [shareButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    shareButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [shareButton adjustToVerticalLayout:CGSizeMake(60, 75)];
    [shareButton addTarget:self action:NSSelectorFromString(self.sharPickerSource[index][@"action"]) forControlEvents:UIControlEventTouchUpInside];
  }

  pickweBgView.transform = CGAffineTransformMakeTranslation(0, 205);
  [UIView animateWithDuration:0.3 animations:^{
    pickweBgView.transform = CGAffineTransformIdentity;
  }];
}

- (void) hideSharePickerView {
  [UIView animateWithDuration:0.3 animations:^{
    pickweBgView.transform = CGAffineTransformMakeTranslation(0, 205);;
  } completion:^(BOOL finished) {
    [shreMaskView removeFromSuperview];
  }];
}

- (void) shareToWeixin{
  // @TODO: share
}

- (void) shareToPengyouquan{
  // @TODO: share
}

- (void) shareToWeibo{
  // @TODO: share
}


- (void)creatTableView
{
  UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT-64) style:UITableViewStylePlain];
  tableView.dataSource = self;
  tableView.delegate = self;
  tableView.backgroundColor = [UIColor clearColor];
  [self.view addSubview:tableView];

  UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 100)];
  footerView.backgroundColor = [UIColor clearColor];
  tableView.tableFooterView = footerView;

  UIButton *logoutButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 50, WIDTH, 50)];
  [logoutButton setTitle:@"退出" forState:UIControlStateNormal];
  [logoutButton addTarget:self action:@selector(logoutAction) forControlEvents:UIControlEventTouchUpInside];
  [logoutButton setBackgroundColor:AEColor(126, 53, 150, 1)];
  [footerView addSubview:logoutButton];
}

#pragma mark -UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  UITableViewCell *cell =nil;
  static NSString *identifer = @"settingVC_Cell";
  cell = [tableView dequeueReusableCellWithIdentifier:identifer];
  if (! cell) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifer];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    if ( indexPath.row == 3 ) {
      UIStackView *imageStackView = [[UIStackView alloc] init];
      [cell addSubview:imageStackView];
      [imageStackView alignTrailingEdgeWithView:cell predicate:@"-35"];
      [imageStackView alignCenterYWithView:cell predicate:@"0"];
      [imageStackView setAxis:UILayoutConstraintAxisHorizontal];
      [imageStackView setSpacing:10];

      NSArray *imageNames = self.dataSource[indexPath.row][@"imageNames"];
      for (int index = 0; index < imageNames.count; index++) {
        UIImageView *iconImage = [[UIImageView alloc]init];
        [imageStackView addArrangedSubview:iconImage];
        [iconImage setContentMode:UIViewContentModeScaleAspectFit];
        [iconImage constrainWidth:@"30" height:@"30"];
        iconImage.image = [UIImage imageNamed:imageNames[index]];
      }
    }
  }

  cell.textLabel.font = [UIFont systemFontOfSize:15];
  cell.textLabel.text = self.dataSource[indexPath.row][@"title"];
  cell.detailTextLabel.text = self.dataSource[indexPath.row][@"message"];

  return cell;
}

#pragma mark -UITableViewDelegate
//组头部的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
  return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  switch (indexPath.row) {
    case 1:
      [self setPsw];
      break;

    case 2: case 5:
      [self performSegueWithIdentifier:self.dataSource[indexPath.row][@"segue"] sender:nil];
      break;

    case 3:// share
      [self showSharePickerView];
      break;

    default:
      break;
  }
}

- (void)setPsw {
  SetPswVC *vc = [SetPswVC storyboardInstance];
  vc.hidesBottomBarWhenPushed = YES;
  [self.navigationController pushViewController:vc animated:YES];

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

  UIViewController *destinatVC = segue.destinationViewController;
  destinatVC.hidesBottomBarWhenPushed = true;
}

-(NSArray *) dataSource {
  if (!_dataSource) {
    NSString *versionStr = [NSString stringWithFormat:@"云健康V%@",[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]];
    NSString *telNumber = @"18888888888";

    NSString *telStr = [telNumber stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
    _dataSource = @[@{@"title":@"登录手机",@"message":telStr,    @"segue":@""},
                    @{@"title":@"修改密码",@"message":@"",       @"segue":@""},
                    @{@"title":@"关于我们",@"message":@"",       @"segue":@"aboutUsSegue"},
                    @{@"title":@"分享",   @"message":@"",       @"imageNames":@[@"weixin",@"pengyouquan"]},
                    @{@"title":@"检查更新",@"message":versionStr,@"segue":@""},
                    @{@"title":@"使用帮助",@"message":@"",       @"segue":@"helpSegue"},];
  }
  return _dataSource;
}

-(NSArray *) sharPickerSource {
  if (!_sharPickerSource) {
    _sharPickerSource = @[@{@"title":@" 微信 ", @"imageName":@"weixin", @"action":@"shareToWeixin"},
                          @{@"title":@"朋友圈",  @"imageName":@"pengyouquan",  @"action":@"shareToPengyouquan"},
                          @{@"title":@"新浪微博",@"imageName":@"weibo", @"action":@"shareToWeibo"}];
  }
  return _sharPickerSource;
}



- (UIStatusBarStyle)preferredStatusBarStyle {
  return UIStatusBarStyleLightContent;
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


@end
