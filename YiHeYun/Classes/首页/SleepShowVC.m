//
//  SleepShowVC.m
//  YiHeYun
//
//  Created by mac on 2017/4/5.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "SleepShowVC.h"

@interface SleepShowVC ()

@end

@implementation SleepShowVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _leftView.layer.borderWidth = 1;
    _leftView.layer.borderColor = AppThemeColor.CGColor;

    _rightView.layer.borderWidth = 1;
    _rightView.layer.borderColor = AppThemeColor.CGColor;

self.title = @"睡眠";

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)daySelectAction:(UIButton *)sender {
    sender.selected = YES;
    _weekBtn.selected = NO;
    _monthBtn.selected = NO;
}

- (IBAction)weekSelectAction:(UIButton *)sender {
    sender.selected = YES;
    _dayBtn.selected = NO;
    _monthBtn.selected = NO;
}

- (IBAction)monthSelectAction:(UIButton *)sender {
    sender.selected = YES;
    _weekBtn.selected = NO;
    _dayBtn.selected = NO;
}
@end
