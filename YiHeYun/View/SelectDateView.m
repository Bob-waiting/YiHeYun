//
//  SelectDateView.m
//  PlayerVideoDemo
//
//  Created by mac on 2017/3/13.
//  Copyright © 2017年 zrgg. All rights reserved.
//

#import "SelectDateView.h"



@interface SelectDateView()
{
    UILabel *titleLB;
    UIDatePicker *datePick;
    CGFloat viewWidth;
    CGFloat viewHeight;
}
@end

@implementation SelectDateView
-(id)initWithMode:(DisplayMode)mode andFrame:(CGRect)frame
    {
        self= [super initWithFrame:frame];
        if (self) {
            self.layer.cornerRadius = 3;
            self.layer.masksToBounds = YES;
            self.backgroundColor = [UIColor whiteColor];
            viewWidth = self.frame.size.width;
            viewHeight = self.frame.size.height;
            _mode=mode;
            [self initView];
        }
        return self;
    }
    
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = 3;
        self.layer.masksToBounds = YES;
        self.backgroundColor = [UIColor whiteColor];
        viewWidth = self.frame.size.width;
        viewHeight = self.frame.size.height;
        [self initView];
    }
    return self;

}

- (void)initView{
    titleLB = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, viewWidth, 40)];
    titleLB.textColor = [UIColor whiteColor];
    titleLB.backgroundColor = [UIColor purpleColor];
    titleLB.textAlignment = NSTextAlignmentCenter;
    [self addSubview:titleLB];

    datePick = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, 30, viewWidth, 180)];
    [datePick addTarget:self action:@selector(showDate) forControlEvents:UIControlEventValueChanged];
    if (_mode==DisplayDate) {
        datePick.datePickerMode=UIDatePickerModeDate;
    }else
    {
        datePick.datePickerMode = UIDatePickerModeDateAndTime;
    }
    datePick.minimumDate = [NSDate date];
//    datePick.locale = [NSLocale localeWithLocaleIdentifier:@"en_GB"];
    [self addSubview:datePick];



    NSDate *date = [datePick date];
    NSDateFormatter *dd = [[NSDateFormatter alloc]init];
    if (_mode==DisplayDate) {
        dd.dateFormat = @"yyyy-MM-dd";
    }else
    {
        dd.dateFormat = @"yyyy-MM-dd EEE HH:mm";
    }
    NSString *dateStr = [dd stringFromDate:date];
    titleLB.text = dateStr;

    UIView *bggView = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height-40, self.frame.size.width, 40)];
    bggView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.1];
    [self addSubview:bggView];

    UIButton *cancleBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, self.frame.size.height-40, self.frame.size.width/2.0, 40)];
    [cancleBtn setTitle:@"取消" forState:0];
    [cancleBtn setTitleColor:[UIColor darkGrayColor] forState:0];
    [cancleBtn addTarget:self action:@selector(cancle) forControlEvents:UIControlEventTouchUpInside];
    cancleBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:cancleBtn];

    UIButton *sureBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.frame.size.width/2.0, self.frame.size.height-40, self.frame.size.width/2.0, 40)];
    [sureBtn setTitle:@"确定" forState:0];
    sureBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [sureBtn setTitleColor:SureButtonTitleColor forState:UIControlStateNormal];
    [sureBtn addTarget:self action:@selector(sure) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:sureBtn];

    UIView *line1 = [[UIView alloc]initWithFrame:CGRectMake(self.frame.size.width/2.0, sureBtn.center.y-10, 1, 20)];
    line1.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:line1];

}
- (void)cancle{
    if (_cancleSelect) {
        _cancleSelect();
    }
}

- (void)sure{

    NSDate *date = [datePick date];
    NSDateFormatter *dd = [[NSDateFormatter alloc]init];
    if (_mode==DisplayDate) {
        dd.dateFormat = @"yyyy-MM-dd";
    }else
    {
        dd.dateFormat = @"yyyy-MM-dd EEE HH:mm";
    }
    NSString *dateStr = [dd stringFromDate:date];
    if (_getSlectDate) {
        _getSlectDate(dateStr);
    }
    if (_cancleSelect) {
        _cancleSelect();
    }
}

- (void)showDate{
    NSDate *date = [datePick date];
    NSDateFormatter *dd = [[NSDateFormatter alloc]init];
    if (_mode==DisplayDate) {
        dd.dateFormat = @"yyyy-MM-dd";
    }else
    {
        dd.dateFormat = @"yyyy-MM-dd EEE HH:mm";
    }
    NSString *dateStr = [dd stringFromDate:date];
    titleLB.text = dateStr;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
