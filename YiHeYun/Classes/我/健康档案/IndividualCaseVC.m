//
//  IndividualCaseVC.m
//  YiHeYun
//
//  Created by Ink on 2017/4/5.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "IndividualCaseVC.h"

@interface IndividualCaseVC ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation IndividualCaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
  [self creatTableView];
}

- (void)addCaseAction {

}

- (void)creatTableView
{
  UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) style:UITableViewStyleGrouped];
  tableView.dataSource = self;
  tableView.delegate = self;
  tableView.backgroundColor = [UIColor clearColor];
  tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
  [self.view addSubview:tableView];

  UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 60)];
  headerView.backgroundColor = [UIColor clearColor];
  tableView.tableHeaderView = headerView;

  UIButton *addCaseBtn = [[UIButton alloc]initWithFrame:CGRectMake(30, 10, WIDTH-60, 40)];
  [addCaseBtn setTitle:@"添加病历" forState:UIControlStateNormal];
  [addCaseBtn addTarget:self action:@selector(addCaseAction) forControlEvents:UIControlEventTouchUpInside];
  [addCaseBtn setTitleColor:[UIColor colorWithRed:126/255.0 green:53/255.0 blue:150/255.0 alpha:1] forState:UIControlStateNormal];
  addCaseBtn.layer.borderWidth = 1;
  addCaseBtn.layer.borderColor = [UIColor colorWithRed:126/255.0 green:53/255.0 blue:150/255.0 alpha:1].CGColor;
  addCaseBtn.layer.cornerRadius = 20;
  addCaseBtn.layer.masksToBounds = true;
  [headerView addSubview:addCaseBtn];
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
  }

  cell.textLabel.font = [UIFont systemFontOfSize:15];
  cell.textLabel.text = @"病历";
  cell.detailTextLabel.text = @"2015年2月22日上传";

  return cell;
}

#pragma mark -UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

-(NSArray *) dataSource {
  if (!_dataSource) {

    _dataSource = @[@"",@"",@"",@""];

  }
  return _dataSource;
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}
@end
