//
//  SleepShowVC.h
//  YiHeYun
//
//  Created by mac on 2017/4/5.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "BaseVC.h"

@interface SleepShowVC : BaseVC
@property (weak, nonatomic) IBOutlet UIScrollView *bgScrollView;
@property (weak, nonatomic) IBOutlet UIView *whiteView;
@property (weak, nonatomic) IBOutlet UILabel *dateLB1;
@property (weak, nonatomic) IBOutlet UILabel *dateLB2;
@property (weak, nonatomic) IBOutlet UILabel *baifenbiLB;
@property (weak, nonatomic) IBOutlet UILabel *sleepStatusLB;
@property (weak, nonatomic) IBOutlet UIButton *statuesLB;
@property (weak, nonatomic) IBOutlet UIButton *dayBtn;
@property (weak, nonatomic) IBOutlet UIButton *weekBtn;
@property (weak, nonatomic) IBOutlet UIButton *monthBtn;
- (IBAction)daySelectAction:(UIButton *)sender;
- (IBAction)weekSelectAction:(UIButton *)sender;
- (IBAction)monthSelectAction:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIView *leftView;
@property (weak, nonatomic) IBOutlet UIView *rightView;

@end
