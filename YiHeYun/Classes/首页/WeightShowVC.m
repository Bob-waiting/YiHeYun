//
//  WeightShowVC.m
//  YiHeYun
//
//  Created by mac on 2017/4/5.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "WeightShowVC.h"

@interface WeightShowVC ()
{

    SCChart *chartView;


}
@end

@implementation WeightShowVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"体重";
    [self configUI];

    _bgScrollView.contentSize = CGSizeMake(0, MAX(_addBtn.maxY+20, _bgScrollView.height+1));
}

- (void)btnPressed:(id)sender {
    [chartView strokeChart];

}

- (void)configUI{
    if (chartView) {
        [chartView removeFromSuperview];
        chartView = nil;
    }

    chartView = [[SCChart alloc] initwithSCChartDataFrame:CGRectMake(0, 10, [UIScreen mainScreen].bounds.size.width - 20, 180)
                                               withSource:self
                                                withStyle:SCChartLineStyle];
    [chartView showInView:_whiteView];
    chartView.lineChart.yUnit = @"kg";
    chartView.lineChart.xUnit = @"day";
}

- (NSArray *)getXTitles:(int)num {
    NSMutableArray *xTitles = [NSMutableArray array];
    for (int i=0; i<num; i++) {
        NSString * str = [NSString stringWithFormat:@"3-%d",i+1];
        [xTitles addObject:str];
    }
    return xTitles;
}

#pragma mark - @required
//横坐标标题数组
- (NSArray *)SCChart_xLableArray:(SCChart *)chart {
    return [self getXTitles:20];
}

//数值多重数组
- (NSArray *)SCChart_yValueArray:(SCChart *)chart {
            NSMutableArray *ary = [NSMutableArray array];
            for (NSInteger i = 0; i < 20; i++) {
                CGFloat num = arc4random_uniform(100);
                NSString *str = [NSString stringWithFormat:@"%f",num];
                [ary addObject:str];
            }
            return @[ary];

}

#pragma mark - @optional
//颜色数组
- (NSArray *)SCChart_ColorArray:(SCChart *)chart {
    return @[AppThemeColor,SCRed,SCGreen];
}

#pragma mark 折线图专享功能
//标记数值区域
- (CGRange)SCChartMarkRangeInLineChart:(SCChart *)chart {
    return CGRangeZero;
}

//判断显示横线条
- (BOOL)SCChart:(SCChart *)chart ShowHorizonLineAtIndex:(NSInteger)index {
    return YES;
}

//判断显示最大最小值
- (BOOL)SCChart:(SCChart *)chart ShowMaxMinAtIndex:(NSInteger)index {
    return NO;
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

- (IBAction)selectStartDateBtn:(UIButton *)sender {
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    [btn addTarget:self action:@selector(grayTouch:) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    [self.view addSubview:btn];

    PickDateView *pickDate = [[PickDateView alloc]initWithFrame:CGRectMake(0, HEIGHT-200, WIDTH, 200) andType:0];;
    [btn addSubview:pickDate];
    pickDate.getDate = ^(NSString *date){
        [sender setTitle:date forState:0];
    };

}
- (void)grayTouch:(UIButton *)sender{
    [UIView animateWithDuration:0.2 animations:^{
        sender.alpha = 0.0;
    } completion:^(BOOL finished) {
        [sender removeFromSuperview];
    }];
}
- (IBAction)selectEndDateBtn:(UIButton *)sender {
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    [btn addTarget:self action:@selector(grayTouch:) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    [self.view addSubview:btn];

    PickDateView *pickDate = [[PickDateView alloc]initWithFrame:CGRectMake(0, HEIGHT-200, WIDTH, 200) andType:0];;
    [btn addSubview:pickDate];
    pickDate.getDate = ^(NSString *date){
        [sender setTitle:date forState:0];
    };
}
- (IBAction)addWeightBtnAction:(UIButton *)sender {
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"请输入当前体重" message:@"" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
         alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
        [alertView show];
    UITextField *nameField = [alertView textFieldAtIndex:0];
    nameField.placeholder = @"请输入体重（kg）";

}

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    UITextField *passwordText = [alertView textFieldAtIndex:0];
    //    passwordText.
    NSLog(@"%@",passwordText.text);
    NSLog(@"buttonIndex:%d",buttonIndex);
}
@end
