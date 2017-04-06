//
//  SelectDateView.h
//  PlayerVideoDemo
//
//  Created by mac on 2017/3/13.
//  Copyright © 2017年 zrgg. All rights reserved.
//
typedef enum : NSUInteger {
    DisplayDateAndTime=0,//默认值
    DisplayDate=1,
} DisplayMode;//设置显示样式

#import <UIKit/UIKit.h>

@interface SelectDateView : UIView

@property(nonatomic)DisplayMode mode;//设置显示的样式
 
@property (nonatomic , copy)NSString *title;

@property (nonatomic , copy)void (^getSlectDate)(NSString *dateStr);
@property (nonatomic , copy)void (^cancleSelect)();
-(id)initWithMode:(DisplayMode)mode andFrame:(CGRect)frame;
@end
