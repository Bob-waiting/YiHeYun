//
//  PanSingleProgressView.h
//  YiHeYun
//
//  Created by zhanbing han on 17/4/4.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PanSingleProgressView : UIView

- (id)initWithFrame:(CGRect)frame andUnit:(NSString *)unit;

@property (nonatomic , copy)NSString *title;
@property (nonatomic , copy)void (^cancleSlect)();
@property (nonatomic , copy)void (^sureSlect)(NSString *);

@end
