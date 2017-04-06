//
//  WeightShowVC.h
//  YiHeYun
//
//  Created by mac on 2017/4/5.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "BaseVC.h"
#import "SCChart.h"
#import "PickDateView.h"

@interface WeightShowVC : BaseVC<UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *startDateBtn;
@property (weak, nonatomic) IBOutlet UIButton *endDateBtn;
- (IBAction)selectStartDateBtn:(UIButton *)sender;
- (IBAction)selectEndDateBtn:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIScrollView *bgScrollView;
@property (weak, nonatomic) IBOutlet UIView *whiteView;
@property (weak, nonatomic) IBOutlet UILabel *weightLB;
@property (weak, nonatomic) IBOutlet UILabel *bmiLB;
@property (weak, nonatomic) IBOutlet UIButton *statesLB;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
- (IBAction)addWeightBtnAction:(UIButton *)sender;

@end
