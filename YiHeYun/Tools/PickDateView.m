//
//  pickDateView.m
//  XWDCApp
//
//  Created by mac on 15/12/7.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "PickDateView.h"

@implementation PickDateView

- (id)initWithFrame:(CGRect)frame andType:(NSInteger)type{
    self = [super initWithFrame:frame];
    if (self) {
         frames = frame;
        dateType = type;
        [self setViews];
       
    }
    return self;
}

- (void)setViews{
    UIView *pickDateView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 50)];
    pickDateView.backgroundColor = [UIColor colorWithRed:0.9373 green:0.9373 blue:0.9373 alpha:1.0];
    [self addSubview:pickDateView];
    
    UIButton *cancel = [[UIButton alloc]initWithFrame:CGRectMake(10, 0, 150, 50)];
    cancel.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [cancel setTitle:@"取消" forState:UIControlStateNormal];
    [cancel setTitleColor:[UIColor colorWithRed:0.0 green:0.3843 blue:0.7529 alpha:1.0] forState:UIControlStateNormal];
      cancel.titleLabel.font = [UIFont systemFontOfSize:17];
    [cancel addTarget:self action:@selector(tttttt) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:cancel];
    
    UIButton *sure = [[UIButton alloc]initWithFrame:CGRectMake(WIDTH-160, 0, 150, 50)];
    [sure setTitleColor:[UIColor colorWithRed:0.0 green:0.3098 blue:0.7333 alpha:1.0] forState:UIControlStateNormal];
    sure.titleLabel.font = [UIFont systemFontOfSize:17];
    [sure addTarget:self action:@selector(sssssss) forControlEvents:UIControlEventTouchUpInside];
     sure.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [sure setTitle:@"确定" forState:UIControlStateNormal];
    [self addSubview:sure];

    pickerDate = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, 40, WIDTH, frames.size.height-50)];

    
  
    pickerDate.backgroundColor = [UIColor whiteColor];
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];//设置为中
    pickerDate.locale = locale;
    [pickerDate addTarget:self action:@selector(getActivityDate:) forControlEvents:UIControlEventValueChanged];
    [self addSubview:pickerDate];
    
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    fmt.dateFormat = @"yyyy-MM-dd";
    pickerDate.datePickerMode = UIDatePickerModeDate;
    ActivityDate = [fmt stringFromDate:[pickerDate date]];
    
    timess = @"晚上";
    
}
#pragma mark   UIDatePicker得到日期控件中的日期
- (void)getActivityDate:(UIDatePicker *)dataPicker
{
    NSDate *selected = [dataPicker date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    ActivityDate = [dateFormatter stringFromDate:selected];
}

#pragma makr - 取消
- (void)tttttt{
    [self.delegate cancelSelect];
    [UIView animateWithDuration:0.2 animations:^{
        self.superview.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self.superview removeFromSuperview];
    }];
}

#pragma  mark - 确定
- (void)sssssss{
    if (_getDate) {
        _getDate(ActivityDate);
    }
    [self tttttt];
//    if (dateType==0) {
//        [self.delegate sureSelect:ActivityDate];
//    }else{
//        [self.delegate sureSelect:[NSString stringWithFormat:@"%@ %@",ActivityDate,timess]];
//    }
}

#pragma makr - 取消
- (void)tttttt1:(UIButton *)sender{
    sender.selected = !sender.selected;
    sure1.selected = !sure1.selected;
    timess = sender.currentTitle;
}

#pragma  mark - 确定
- (void)sssssss1:(UIButton *)sender{
   sender.selected = !sender.selected;
    cancel1.selected = !cancel1.selected;
    timess = sender.currentTitle;
}

@end
