//
//  AddFriendVC.m
//  YiHeYun
//
//  Created by Ink on 2017/4/2.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "AddFriendVC.h"

@interface AddFriendVC ()<UITableViewDataSource,UITableViewDelegate>
{
  NSMutableArray *textFieldArray; //[tel,remark,verification]
  UIButton *verificationSendButton;
}

@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation AddFriendVC

- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = @"设置";

  self.dataSource = @[@{@"title":@"手机号", @"placeholder":@"请输入手机号"},
    @{@"title":@"备注名",  @"placeholder":@"请输入备注名"},
    @{@"title":@"验证码",@"placeholder":@"请输入验证码"}];

  textFieldArray = [NSMutableArray new];
  [self creatTableView];
}

- (void)saveFriendAction {

}

-(void)sendVerificationAction {
  [self startTimeCount:verificationSendButton];
  [self cancelTimeCount];
}

- (void)creatTableView
{
  UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT-64) style:UITableViewStylePlain];
  tableView.dataSource = self;
  tableView.delegate = self;
  tableView.backgroundColor = [UIColor clearColor];
  [self.view addSubview:tableView];

  UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 70)];
  footerView.backgroundColor = [UIColor clearColor];
  tableView.tableFooterView = footerView;

  UIButton *logoutButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 20, WIDTH, 50)];
  [logoutButton setTitle:@"添加" forState:UIControlStateNormal];
  [logoutButton addTarget:self action:@selector(saveFriendAction) forControlEvents:UIControlEventTouchUpInside];
  [logoutButton setBackgroundColor:AEColor(126, 53, 150, 1)];
  [footerView addSubview:logoutButton];
}

#pragma mark -UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  UITableViewCell *cell =nil;
  static NSString *identifer = @"addFriendCell";
  cell = [tableView dequeueReusableCellWithIdentifier:identifer];
  if (! cell) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    UITextField *textField = [UITextField new];
    [cell addSubview:textField];
    [textFieldArray addObject:textField];
    textField.borderStyle = UITextBorderStyleNone;
    [textField alignCenterYWithView:cell predicate:@"0"];
    [textField alignLeading:@"80" trailing:@"-100" toView:cell];
    [textField alignLeadingEdgeWithView:cell predicate:@"80"];

    if (indexPath.section == 2) { //verification
      verificationSendButton = [UIButton buttonWithType:UIButtonTypeCustom];
      [cell addSubview:verificationSendButton];
      [verificationSendButton setTitle:@"发送验证码" forState:UIControlStateNormal];
      verificationSendButton.titleLabel.font = [UIFont systemFontOfSize:12];
      [verificationSendButton constrainWidth:@"80" height:@"30"];
      [verificationSendButton constrainLeadingSpaceToView:textField predicate:@"0"];
      [verificationSendButton alignCenterYWithView:cell predicate:@"0"];
      verificationSendButton.layer.cornerRadius = 3;
      verificationSendButton.layer.masksToBounds= true;
      verificationSendButton.backgroundColor = AEColor(126, 53, 150, 1);
      [verificationSendButton addTarget:self action:@selector(sendVerificationAction) forControlEvents:UIControlEventTouchUpInside];
    }
  }

  cell.textLabel.font = [UIFont systemFontOfSize:15];
  cell.textLabel.text = self.dataSource[indexPath.section][@"title"];

  UITextField *tetxField = textFieldArray[indexPath.section];
  tetxField.placeholder = self.dataSource[indexPath.section][@"placeholder"];

  return cell;
}

#pragma mark -UITableViewDelegate
//组头部的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
  return 10;
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
