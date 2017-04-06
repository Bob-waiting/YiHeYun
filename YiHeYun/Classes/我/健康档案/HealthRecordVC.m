//
//  HealthRecordVC.m
//  YiHeYun
//
//  Created by Ink on 2017/3/28.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "HealthRecordVC.h"
#import "UIImage+Color.h"

#import "UserInfoVC.h"
#import "LiveHabitVC.h"
#import "IndividualCaseVC.h"

#import "SUNSlideSwitchView.h"

@interface HealthRecordVC ()<SUNSlideSwitchViewDelegate, SlideSwitchSubviewDelegate>
{
  SUNSlideSwitchView *slideSwitchView;
  BOOL notFirst;
  NSArray *titleArray;
}

//显示的内容view
@property (nonatomic, strong) NSArray *childVCS;
@property (nonatomic,strong) UIView *headView;


@end

@implementation HealthRecordVC

- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = @"健康档案";
  [self.navBar setBackgroundImage:[UIImage imageWithColor:AEColor(126, 53, 150, 1)] forBarMetrics:0];
  self.navBar.shadowImage=[UIImage new];
  [self.navBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];

  [self creatHeadView];
  [self createSlideSwitchView];
}

- (NSArray *)childVCS {
  if (!_childVCS) {
    _childVCS = @[[[UserInfoVC alloc] init],
                  [[LiveHabitVC alloc] init],
                  [[LiveHabitVC alloc] init],
                  [[IndividualCaseVC alloc] init]];
    titleArray = @[@"个人资料",@"家庭病史",@"生活习惯",@"专属病史"];
  }
  return _childVCS;
}


- (void)createSlideSwitchView {
  slideSwitchView = [[SUNSlideSwitchView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.headView.frame), WIDTH, HEIGHT-CGRectGetMaxY(self.headView.frame))];
  [self.view addSubview:slideSwitchView];
  slideSwitchView.slideSwitchViewDelegate = self;

  slideSwitchView.tabItemNormalColor = [UIColor blackColor];
  slideSwitchView.shadowImage = [[UIImage imageNamed:@"red_line_and_shadow"]
                                 stretchableImageWithLeftCapWidth:WIDTH/[titleArray count] topCapHeight:5.0f];

  for (int index = 0 ; index < self.childVCS.count; index++) {
    HealthRecordChildBaseVC *vc = self.childVCS[index];
    vc.title = titleArray[index];
    vc.mainView = self;
  }

  [slideSwitchView buildUI];
}

- (void)creatHeadView
{
  UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, WIDTH/1.8)];
  headView.backgroundColor = [UIColor colorWithRed:126/255.0 green:53/255.0 blue:150/255.0 alpha:1];
  [self.view addSubview:headView];

  UILabel *mineLab = [[UILabel alloc]initWithFrame:CGRectMake((WIDTH-20)/2, 20, 20, 20)];
  mineLab.text = @"我";
  mineLab.textColor = [UIColor whiteColor];
  mineLab.font = [UIFont systemFontOfSize:18];
  [headView addSubview:mineLab];

  UIImageView *mineImage = [[UIImageView alloc]initWithFrame:CGRectMake((WIDTH-50)/2, (WIDTH/1.8-50)/2, 50, 50)];
  mineImage.layer.cornerRadius = 25;
  mineImage.layer.masksToBounds = YES;
  mineImage.backgroundColor = [UIColor whiteColor];
  [headView addSubview:mineImage];

  UILabel *mineNameLab = [[UILabel alloc]initWithFrame:CGRectMake((WIDTH-120)/2, CGRectGetMaxY(mineImage.frame)+10, 120, 40)];
  mineNameLab.text = @"李玲玲";
  mineNameLab.textColor = [UIColor whiteColor];
  mineNameLab.textAlignment = NSTextAlignmentCenter;
  mineNameLab.font = [UIFont systemFontOfSize:30];
  [headView addSubview:mineNameLab];

  self.headView = headView;
}
-(void)changeMainDisplaySubview:(NSNotification*)notification {
  NSInteger selectIndex = [notification.object integerValue];
  [slideSwitchView setSelectedViewIndex:selectIndex andAnimation:NO];
}

#pragma mark SUNSlideSwitchViewDelegate
/*
 * 返回tab个数
 */
- (NSUInteger)numberOfTab:(SUNSlideSwitchView *)view {
  return self.childVCS.count;
}

/*
 * 每个tab所属的viewController
 */
- (UIViewController *)slideSwitchView:(SUNSlideSwitchView *)view viewOfTab:(NSUInteger)number {
  return self.childVCS[number];
}


#pragma mark - SlideSwitchSubviewDelegate
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
  [viewController.navigationItem setHidesBackButton:YES];
  [self.navigationController pushViewController:viewController animated:animated];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
