//
//  FriendsVC.m
//  YiHeYun
//
//  Created by Ink on 2017/3/28.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "FriendsVC.h"
#import "UIScrollView+EmptyDataSet.h"
#import "UIImage+Color.h"
#import "UIImage+Additions.h"

@interface FriendsVC ()<DZNEmptyDataSetSource, DZNEmptyDataSetDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation FriendsVC

- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = @"朋友";

  // TODO: test
  if (arc4random()%2 == 0) {
    self.dataSource = [NSArray new];
  } else {
    self.dataSource = @[@"张三",@"张三",@"张三"];
  }
  [self creatTableView];
}

- (void)addFriend {
  [self performSegueWithIdentifier:@"addFriendSegue" sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

  if ([segue.identifier  isEqual: @"friendInfoSegue"]) {
    UIViewController *friendInfoVC = segue.destinationViewController;
    friendInfoVC.hidesBottomBarWhenPushed = true;

//    NSObject *frendInfo = sender;
//    friendInfoVC.Info = frendInfo
  }

}

#pragma mark - UITableView
- (void)creatTableView
{
  UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT-64) style:UITableViewStylePlain];
  tableView.dataSource = self;
  tableView.delegate = self;
  tableView.emptyDataSetSource = self;
  tableView.emptyDataSetDelegate = self;
  tableView.backgroundColor = [UIColor clearColor];
  [self.view addSubview:tableView];
  tableView.tableFooterView = [UIView new];
}

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
  cell.textLabel.text = self.dataSource[indexPath.row];
  return cell;
}

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
  [self performSegueWithIdentifier:@"friendInfoSegue" sender:self.dataSource[indexPath.row]];
}

#pragma mark - EmptyDataSet

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
  NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:18.0f],
                               NSForegroundColorAttributeName: [UIColor lightGrayColor]};
  return [[NSAttributedString alloc] initWithString:@"暂未添加朋友" attributes:attributes];
}

- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state {
  NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:18.0f],
                               NSForegroundColorAttributeName: [UIColor whiteColor]};
  return [[NSAttributedString alloc] initWithString:@"添加朋友" attributes:attributes];
}

- (UIImage *)buttonBackgroundImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state {
  return [[UIImage imageWithColor:AEColor(126, 53, 150, 1) size:CGSizeMake(300, 56)] imageWithCornerRadius:28];
}

- (CGFloat)spaceHeightForEmptyDataSet:(UIScrollView *)scrollView {
  return 80;
}

- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView{
  return -120;
}

-(void)emptyDataSet:(UIScrollView *)scrollView didTapButton:(UIButton *)button
{
  [self addFriend];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
