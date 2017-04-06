//
//  BloodPressureVC.h
//  YiHeYun
//
//  Created by mac on 2017/4/5.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "BaseVC.h"
#import "SCChart.h"

@interface BloodPressureVC : BaseVC
@property (weak, nonatomic) IBOutlet UIButton *startDateBtn;
@property (weak, nonatomic) IBOutlet UIButton *endDateBtn;
- (IBAction)selectStartDateBtn:(UIButton *)sender;
- (IBAction)selectEndDateBtn:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIScrollView *bgScrollView;
@property (weak, nonatomic) IBOutlet UIView *whiteView;
@property (weak, nonatomic) IBOutlet UILabel *bloodPrssureLB;
@property (weak, nonatomic) IBOutlet UIButton *statusBtn;

@end
