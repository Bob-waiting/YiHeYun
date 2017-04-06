
//
//  pickDateView.h
//  XWDCApp
//
//  Created by mac on 15/12/7.
//  Copyright © 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PpickDateViewDelegate <NSObject>

- (void)cancelSelect;
- (void)sureSelect:(NSString *)date;

@end

@interface PickDateView : UIView
{
    UIDatePicker *pickerDate;// 日历控件
    NSString *ActivityDate;
    CGRect frames;
    NSInteger dateType;///显示时间的类型
    NSString *timess;///上午还是下午
    UIButton *cancel1;///晚上按钮
    UIButton *sure1;///中午按钮
}

@property (nonatomic , assign)id<PpickDateViewDelegate> delegate;
/**
 *  初始化函数
 *
 *  @param frame 视图的位置
 *  @param type  是否要显示时间 1代表显示时间和日期   0代表不显示时间显示日期
 *
 *  @return
 */
- (id)initWithFrame:(CGRect)frame andType:(NSInteger)type;

@property (nonatomic , copy)void (^getDate)(NSString *date);
@end
