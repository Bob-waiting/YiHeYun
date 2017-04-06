//
//  UserInfoVC.m
//  YiHeYun
//
//  Created by Ink on 2017/4/5.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "UserInfoVC.h"
#import "EditVC.h"
#import "InfoTableViewCell.h"


@interface UserInfoVC ()<UITableViewDataSource, UITableViewDelegate,EditVCDeleget>
@property(nonatomic,strong)UITableView *myTableView;
@property(nonatomic,strong)NSArray *typeArray;
@property(nonatomic,strong)NSArray *contentArray;
@property(nonatomic,strong)InfoTableViewCell *infoTableViewCell;
@end

@implementation UserInfoVC

- (void)viewDidLoad {
  [super viewDidLoad];
  [self initData];
  [self initView];
}
-(void)initData{
  _typeArray=@[@"性别",@"年龄",@"体重",@"身高",@"步长",@"血型",@"姓名",@"身份证",@"手机",@"职业"];
  _contentArray=@[@"女",@"18岁",@"60kg",@"170cm",@"40cm",@"AB",@"洪秀全",@"110311190304124526",@"137****8888",@"程序员"];
}
-(void)initView{
  _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) style:UITableViewStylePlain];
  _myTableView.dataSource = self;
  _myTableView.delegate = self;
  [_myTableView registerClass:[InfoTableViewCell class] forCellReuseIdentifier:@"InfoTableViewCellMark"];
  _myTableView.tableFooterView = [[UIView alloc] init];
  _myTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
  [self.view addSubview:_myTableView];
}
#pragma mark -UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return _typeArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  _infoTableViewCell = [tableView dequeueReusableCellWithIdentifier:@"InfoTableViewCellMark"];
  _infoTableViewCell.selectionStyle = UITableViewCellSelectionStyleNone;
  _infoTableViewCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
  _infoTableViewCell.textLabel.font = [UIFont systemFontOfSize:15];
  _infoTableViewCell.textLabel.text = _typeArray[indexPath.row];
  _infoTableViewCell.contentLab.text= _contentArray[indexPath.row];
  _infoTableViewCell.contentLab.hidden=NO;
  _infoTableViewCell.iconImage.hidden=YES;
  return _infoTableViewCell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return 44;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  EditVC *vc=[[EditVC alloc]init];
  vc.delegate=self;
  vc.row=indexPath.row;
  [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark -EditVC保存返回后的代理
-(void)endEditMeInfo:(NSString *)info andInRow:(NSInteger)row{

}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
