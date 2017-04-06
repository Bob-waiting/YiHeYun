//
//  BloodSugarVC.h
//  YiHeYun
//
//  Created by mac on 2017/4/5.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "BaseVC.h"

@interface BloodSugarCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLB;
@property (weak, nonatomic) IBOutlet UILabel *LB1;
@property (weak, nonatomic) IBOutlet UILabel *LB2;
@property (weak, nonatomic) IBOutlet UILabel *LB3;
@property (weak, nonatomic) IBOutlet UILabel *LB4;
@property (weak, nonatomic) IBOutlet UILabel *LB5;
@property (weak, nonatomic) IBOutlet UIView *line1View;
@property (weak, nonatomic) IBOutlet UIView *line12View;
@property (weak, nonatomic) IBOutlet UIView *line3View;
@property (weak, nonatomic) IBOutlet UIView *line4View;
@property (weak, nonatomic) IBOutlet UIView *line5View;
@property (weak, nonatomic) IBOutlet UIView *line6View;

@end

@interface BloodSugarVC : BaseVC<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *listTabView;

@end
