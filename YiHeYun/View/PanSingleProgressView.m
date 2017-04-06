//
//  PanSingleProgressView.m
//  YiHeYun
//
//  Created by zhanbing han on 17/4/4.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "PanSingleProgressView.h"

@interface PanSingleProgressView()
{
    UILabel *titleLB;
    UILabel *radiusLB;
    NSString *_unit;
    UISlider *sliderView;
    UILabel *upLB;
    UILabel *downLB;
    NSString *radiusValue;
}

@end

@implementation PanSingleProgressView

- (void)setTitle:(NSString *)title{
    titleLB.text = title;
}

- (id)initWithFrame:(CGRect)frame andUnit:(NSString *)unit{
    self = [super initWithFrame:frame];
    if (self) {
        _unit = unit;
        radiusValue = @"1";
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = YES;
        self.backgroundColor = [UIColor whiteColor];
        [self initView];
    }
    return self;
}

- (void)initView{
    titleLB = [[UILabel alloc]initWithFrame:CGRectMake(0, 5, self.frame.size.width, 30)];
    titleLB.textAlignment = NSTextAlignmentCenter;
    titleLB.backgroundColor = [UIColor clearColor];
    titleLB.font = [UIFont systemFontOfSize:14];
    titleLB.textColor = [UIColor colorWithRed:0.110 green:0.118 blue:0.125 alpha:1.000];
    [self addSubview:titleLB];
    
    radiusLB = [[UILabel alloc]initWithFrame:CGRectMake(30, 35, self.frame.size.width-60, 20)];
    radiusLB.textAlignment = NSTextAlignmentCenter;
    radiusLB.textColor = [UIColor colorWithRed:0.271 green:0.275 blue:0.278 alpha:1.000];
    radiusLB.font = [UIFont systemFontOfSize:13];
    
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"1%@",_unit]];
    [attrStr addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:18] range:NSMakeRange(0, 1)];
    [attrStr addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, 1)];
    radiusLB.attributedText = attrStr;
    [self addSubview:radiusLB];
    
    upLB = [[UILabel alloc]initWithFrame:CGRectMake(10, 75, 40, 20)];
    upLB.textAlignment = NSTextAlignmentLeft;
    upLB.textColor = [UIColor colorWithRed:0.271 green:0.275 blue:0.278 alpha:1.000];
    upLB.text = [NSString stringWithFormat:@"0%@",_unit];
    upLB.font = [UIFont systemFontOfSize:13];
    [self addSubview:upLB];
    
    sliderView = [[UISlider alloc]initWithFrame:CGRectMake(45, 75, self.frame.size.width-95, 20)];
    sliderView.tintColor = [UIColor purpleColor];
    sliderView.value = 1;
    sliderView.maximumValue = 10;
    sliderView.minimumValue = 0;
    sliderView.minimumTrackTintColor = [UIColor purpleColor];
    sliderView.maximumTrackTintColor = [UIColor colorWithRed:175/255.0 green:105/255.0 blue:199/255.0 alpha:1.0];
    [self addSubview:sliderView];
    [sliderView addTarget:self action:@selector(setValue:) forControlEvents:UIControlEventAllEvents];
    
    
    downLB = [[UILabel alloc]initWithFrame:CGRectMake(self.width-50, 75, 40, 20)];
    downLB.textAlignment = NSTextAlignmentRight;
    downLB.textColor = [UIColor colorWithRed:0.271 green:0.275 blue:0.278 alpha:1.000];
    downLB.font = [UIFont systemFontOfSize:13];
    downLB.text = [NSString stringWithFormat:@"11%@",_unit];
    [self addSubview:downLB];
    
    UIView *bggView = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height-40, self.frame.size.width, 40)];
    bggView.backgroundColor = [UIColor colorWithRed:0.910 green:0.918 blue:0.922 alpha:1.000];
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
    
    [sureBtn setTitleColor:AppThemeColor forState:UIControlStateNormal];
    [sureBtn addTarget:self action:@selector(sure) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:sureBtn];
    
    UIView *line1 = [[UIView alloc]initWithFrame:CGRectMake(self.frame.size.width/2.0, sureBtn.center.y-10, 1, 20)];
    line1.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:line1];
}

- (void)cancle{
    if (_cancleSlect) {
        _cancleSlect();
    }
}

- (void)sure{
    if (_sureSlect) {
        _sureSlect(radiusValue);
    }
//    if (_cancleSlect) {
//        _cancleSlect();
//    }
}

- (void)setValue:(UISlider *)sender{
    if ([sender isEqual:sliderView]) {
        radiusValue = [NSString stringWithFormat:@"%d",(int)sliderView.value];
        
        NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@%@",radiusValue,_unit]];
        [attrStr addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:18] range:NSMakeRange(0, radiusValue.length)];
        [attrStr addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, radiusValue.length)];
        radiusLB.attributedText = attrStr;
    }
}

@end
