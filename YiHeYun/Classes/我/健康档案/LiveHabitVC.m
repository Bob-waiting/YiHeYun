//
//  LiveHabitVC.m
//  YiHeYun
//
//  Created by Ink on 2017/4/5.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "LiveHabitVC.h"

@interface LiveHabitVC ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSArray *dataSource;


@end

@implementation LiveHabitVC

- (void)viewDidLoad {
  [super viewDidLoad];

  [self creatTableView];
}

- (void)creatTableView
{
  UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) style:UITableViewStyleGrouped];
  tableView.dataSource = self;
  tableView.delegate = self;
  tableView.backgroundColor = [UIColor clearColor];
  tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
  [self.view addSubview:tableView];
}

#pragma mark -UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return [self.dataSource[section][@"data"] count];
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
  cell.textLabel.text = self.dataSource[indexPath.section][@"data"][indexPath.row][@"title"];
  cell.detailTextLabel.text = self.dataSource[indexPath.section][@"data"][indexPath.row][@"message"];

  return cell;
}

#pragma mark -UITableViewDelegate
//组头部的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
  return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return 44;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
  return self.dataSource[section][@"grouptitle"];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

-(NSArray *) dataSource {
  if (!_dataSource) {

    _dataSource = @[@{@"grouptitle":@"体育锻炼", @"data":@[@{@"title":@"锻炼频次",@"message":@"每天",@"action":@""},
                                                       @{@"title":@"单次锻炼时长",@"message":@"小于30分钟",@"action":@""},
                                                       @{@"title":@"坚持锻炼时间",@"message":@"小于一年",@"action":@""},
                                                       @{@"title":@"锻炼方式",@"message":@"散步",@"action":@""}
                                                       ]},
                    @{@"grouptitle":@"吸烟情况", @"data":@[@{@"title":@"吸烟状况",@"message":@"从不吸烟",@"action":@""},
                                                       @{@"title":@"日吸烟量",@"message":@"小于5支",@"action":@""},
                                                       @{@"title":@"开始吸烟年龄",@"message":@"小于15岁",@"action":@""},
                                                       @{@"title":@"戒烟年龄",@"message":@"小于15岁",@"action":@""}
                                                       ]},
                    @{@"grouptitle":@"饮酒情况", @"data":@[@{@"title":@"饮酒频率",@"message":@"从不饮酒",@"action":@""},
                                                       @{@"title":@"常饮类别",@"message":@"白酒",@"action":@""},
                                                       @{@"title":@"日饮酒量",@"message":@"小于二两",@"action":@""},
                                                       @{@"title":@"是否戒酒",@"message":@"未戒酒",@"action":@""},
                                                       @{@"title":@"戒酒年龄",@"message":@"小于15岁",@"action":@""},
                                                       @{@"title":@"开始饮酒年龄",@"message":@"小于15岁",@"action":@""},
                                                       @{@"title":@"近年是否醉酒",@"message":@"是",@"action":@""},
                                                       @{@"title":@"饮食习惯",@"message":@"荤素均衡",@"action":@""}
                                                       ]}
                    ];

  }
  return _dataSource;
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
